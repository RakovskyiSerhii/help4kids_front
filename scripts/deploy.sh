#!/bin/bash

# Deployment script for Flutter web app
# This script builds and prepares the app for deployment
# Usage: ./scripts/deploy.sh [domain]

set -e

DOMAIN=${1:-"yourdomain.com"}
DEPLOY_DIR="deploy"
BUILD_DIR="build/web"

echo "🚀 Starting deployment preparation..."
echo "📌 Domain: $DOMAIN"

# Run production build
echo "🏗️  Building for production..."
./scripts/build_production.sh

# Create deployment directory
echo "📁 Creating deployment package..."
rm -rf $DEPLOY_DIR
mkdir -p $DEPLOY_DIR

# Copy build files
echo "📋 Copying build files..."
cp -r $BUILD_DIR/* $DEPLOY_DIR/

# Create nginx config
echo "⚙️  Generating nginx configuration..."
cat > $DEPLOY_DIR/nginx.conf <<EOF
server {
    listen 80;
    server_name $DOMAIN www.$DOMAIN;

    # Redirect HTTP to HTTPS
    return 301 https://\$server_name\$request_uri;
}

server {
    listen 443 ssl http2;
    server_name $DOMAIN www.$DOMAIN;

    # SSL configuration (update paths after setting up SSL)
    # ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
    # ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;

    root /var/www/help4kids_front;
    index index.html;

    # Gzip compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css text/xml text/javascript application/x-javascript application/xml+rss application/json application/javascript;

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;

    # Flutter web app routing
    location / {
        try_files \$uri \$uri/ /index.html;
    }

    # Cache static assets
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # API proxy (if backend is on same domain)
    location /api/ {
        proxy_pass http://localhost:8080/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

echo "✅ Deployment package created in $DEPLOY_DIR/"
echo ""
echo "📝 Deployment instructions:"
echo "1. Upload the contents of $DEPLOY_DIR/ to your VPS at /var/www/help4kids_front"
echo "2. Copy nginx.conf to /etc/nginx/sites-available/help4kids_front"
echo "3. Create symlink: sudo ln -s /etc/nginx/sites-available/help4kids_front /etc/nginx/sites-enabled/"
echo "4. Set up SSL: sudo certbot --nginx -d $DOMAIN -d www.$DOMAIN"
echo "5. Test nginx: sudo nginx -t"
echo "6. Reload nginx: sudo systemctl reload nginx"

