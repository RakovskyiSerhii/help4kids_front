# Part 2 — 13: Deployment

> **Prev:** [12 — Localization](12_localization.md)

**Flutter:** `flutter build web` → output in `build/web/`
**Angular:** `ng build --configuration production` → output in `dist/help4kids/browser/`

Your existing VPS + Nginx setup works with minimal changes.

---

## Build for Production

```bash
ng build --configuration production
```

Output in `dist/help4kids/browser/`:
```
dist/help4kids/browser/
├── index.html
├── main-HASH.js          ← your app code (minified, tree-shaken)
├── polyfills-HASH.js
├── styles-HASH.css
├── assets/
│   ├── i18n/
│   │   ├── uk.json
│   │   └── en.json
│   └── images/
└── favicon.ico
```

All filenames contain a content hash — browsers cache them indefinitely and bust cache automatically when content changes.

---

## Nginx Configuration

Replace your existing Flutter web config. Only one line changes (`root` path):

```nginx
# /etc/nginx/sites-available/help4kids.com
server {
    listen 80;
    listen [::]:80;
    server_name help4kids.com www.help4kids.com;

    # Redirect HTTP → HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name help4kids.com www.help4kids.com;

    ssl_certificate /etc/letsencrypt/live/help4kids.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/help4kids.com/privkey.pem;

    # Angular build output
    root /var/www/help4kids/dist/help4kids/browser;
    index index.html;

    # Angular SPA routing — serve index.html for all routes
    # This is the critical difference from static sites
    location / {
        try_files $uri $uri/ /index.html;
    }

    # Proxy API to Spring Boot backend
    location /api/ {
        proxy_pass http://localhost:8080/api/;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # Long cache for hashed assets
    location ~* \.(js|css|woff2|woff|ttf|eot|svg|png|jpg|gif|ico)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # No cache for index.html (always fetch the latest)
    location = /index.html {
        add_header Cache-Control "no-cache, no-store, must-revalidate";
    }

    # Gzip compression
    gzip on;
    gzip_types text/plain application/javascript text/css application/json;
    gzip_min_length 1000;
}
```

---

## Deploy Script

Drop-in replacement for your `redeploy.sh`:

```bash
#!/bin/bash
# deploy.sh

set -e  # exit on any error

SERVER_USER="ubuntu"
SERVER_HOST="173.242.53.114"
REMOTE_PATH="/var/www/help4kids"
BUILD_DIR="dist/help4kids/browser"

echo "🔨 Building Angular app..."
ng build --configuration production

echo "📤 Uploading to server..."
rsync -avz --delete \
  "$BUILD_DIR/" \
  "$SERVER_USER@$SERVER_HOST:$REMOTE_PATH/dist/help4kids/browser/"

echo "🔄 Reloading Nginx..."
ssh "$SERVER_USER@$SERVER_HOST" "sudo systemctl reload nginx"

echo "✅ Deployment complete!"
```

Make it executable: `chmod +x deploy.sh`
Run it: `./deploy.sh`

---

## Maintenance Mode

Your existing maintenance mode pattern works the same way. Add to Nginx:

```nginx
# Maintenance mode — uncomment to enable
# return 503;

error_page 503 /maintenance.html;
location = /maintenance.html {
    root /var/www/help4kids/maintenance;
    internal;
}
```

Or handle it in Angular with a maintenance check on app startup:

```typescript
// app.component.ts
@Component({ ... })
export class AppComponent implements OnInit {
  ngOnInit(): void {
    // Check maintenance mode from a simple JSON endpoint
    this.http.get<{ maintenance: boolean }>('/api/status').subscribe(status => {
      if (status.maintenance) {
        this.router.navigate(['/maintenance']);
      }
    });
  }
}
```

---

## Environment-Specific Builds

```bash
# Development (default)
ng serve                              # localhost:4200, hot reload

# Staging
ng build --configuration staging      # uses environment.staging.ts

# Production
ng build --configuration production   # uses environment.prod.ts, full optimization
```

---

## Build Budgets

Angular warns when bundle size exceeds budgets. Set sensible limits in `angular.json`:

```json
"budgets": [
  {
    "type": "initial",
    "maximumWarning": "600kB",
    "maximumError": "1MB"
  },
  {
    "type": "anyComponentStyle",
    "maximumWarning": "4kB",
    "maximumError": "8kB"
  }
]
```

If you exceed the budget, use lazy loading (`loadComponent`) to split the bundle.

---

## Analyzing Bundle Size

```bash
# Generate stats file
ng build --stats-json

# Visualize with webpack-bundle-analyzer
npx webpack-bundle-analyzer dist/help4kids/browser/stats.json
```

This shows what takes up space — useful for finding packages to lazy-load or replace.

---

## CI/CD with GitHub Actions

```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'

      - run: npm ci

      - run: npx ng build --configuration production

      - name: Deploy to server
        uses: appleboy/scp-action@v0.1.7
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USER }}
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          source: "dist/help4kids/browser/*"
          target: "/var/www/help4kids/dist/help4kids/browser"
          strip_components: 3

      - name: Reload Nginx
        uses: appleboy/ssh-action@v1.0.0
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USER }}
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          script: sudo systemctl reload nginx
```

---

## Checklist Before First Deploy

- [ ] `environment.prod.ts` has correct API URL (empty string if same domain)
- [ ] Nginx `root` points to `dist/help4kids/browser`
- [ ] Nginx has `try_files $uri $uri/ /index.html` for SPA routing
- [ ] Nginx proxies `/api/` to Spring Boot on port 8080
- [ ] SSL certificate configured
- [ ] `ng build --configuration production` runs without errors
- [ ] Bundle size under 1MB initial (check with `--stats-json`)

---

## Further Reading

- [Angular Deployment Guide](https://angular.dev/tools/cli/deployment) — official
- [Nginx SPA Configuration](https://angular.dev/tools/cli/deployment#nginx)
- [Angular Build Configuration](https://angular.dev/reference/configs/angular-json)
- [GitHub Actions for Angular](https://github.com/actions/setup-node) — CI/CD

---

> **Prev:** [12 — Localization](12_localization.md)

---

# Course Complete!

You've covered everything from TypeScript basics through a full production-ready Angular app. The key insight: your Flutter knowledge translates almost directly — Cubit → Service, GoRouter → Angular Router, Dio → HttpClient, GetIt → built-in DI, BlocBuilder → `async` pipe. The patterns are the same, the syntax is different.
