# Part 2 — 01: Project Setup

> **Next:** [02 — Environments & Config](02_environments.md)

---

## Create the Angular Project

```bash
# Install Angular CLI globally (once)
npm install -g @angular/cli

# Create project — similar to flutter create
ng new help4kids \
  --style=scss \
  --routing=false \   # we define routes manually in app.routes.ts
  --standalone        # modern Angular, no NgModules

cd help4kids

# Add Angular Material (sets up theme, animations, typography)
ng add @angular/material
# Prompts:
#  Theme: Custom
#  Typography: Yes
#  Animations: Yes

# Angular CDK (layout utilities — BreakpointObserver etc.)
# Already included by Angular Material

# HTML sanitization (for article content — replaces flutter_html)
npm install dompurify
npm install @types/dompurify --save-dev

# i18n (replaces intl + .arb files)
npm install @jsverse/transloco

# Date utilities
npm install date-fns
```

---

## package.json — Key Scripts

```json
{
  "scripts": {
    "start": "ng serve",
    "build": "ng build",
    "build:prod": "ng build --configuration production",
    "test": "ng test",
    "lint": "ng lint",
    "generate": "ng generate"
  }
}
```

| Flutter command | Angular equivalent |
|---|---|
| `flutter run -d chrome` | `ng serve` (opens at localhost:4200) |
| `flutter build web` | `ng build --configuration production` |
| `flutter test` | `ng test` |
| `flutter pub get` | `npm install` |
| `flutter pub add package` | `npm install package` |

---

## tsconfig.json — Strict TypeScript

Ensure strict mode is enabled — same guarantees as Dart's sound null safety:

```json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictPropertyInitialization": true,
    "noImplicitOverride": true,
    "noPropertyAccessFromIndexSignature": true,
    "forceConsistentCasingInFileNames": true,
    "target": "ES2022",
    "useDefineForClassFields": false,
    "lib": ["ES2022", "dom"],
    "module": "ES2022",
    "moduleResolution": "bundler",
    "experimentalDecorators": true,
    "paths": {
      "@core/*": ["src/app/core/*"],
      "@data/*": ["src/app/data/*"],
      "@features/*": ["src/app/features/*"],
      "@shared/*": ["src/app/shared/*"],
      "@env/*": ["src/environments/*"]
    }
  }
}
```

The `paths` aliases let you write `import { AuthService } from '@core/services/auth.service'` instead of relative paths.

---

## angular.json — Build Config

Key settings to know:

```json
{
  "projects": {
    "help4kids": {
      "architect": {
        "build": {
          "options": {
            "outputPath": "dist/help4kids",
            "index": "src/index.html",
            "browser": "src/main.ts",
            "polyfills": ["zone.js"],
            "assets": ["src/favicon.ico", "src/assets"],
            "styles": ["src/styles.scss"],
            "scripts": []
          },
          "configurations": {
            "production": {
              "optimization": true,
              "outputHashing": "all",
              "budgets": [
                {
                  "type": "initial",
                  "maximumWarning": "500kB",
                  "maximumError": "1MB"
                }
              ]
            }
          }
        }
      }
    }
  }
}
```

---

## Final Directory Structure

```
help4kids/
├── src/
│   ├── main.ts
│   ├── index.html
│   ├── styles.scss
│   ├── environments/
│   │   ├── environment.ts
│   │   └── environment.prod.ts
│   └── app/
│       ├── app.component.ts
│       ├── app.component.html
│       ├── app.component.scss
│       ├── app.config.ts
│       ├── app.routes.ts
│       ├── core/
│       │   ├── guards/
│       │   │   ├── auth.guard.ts
│       │   │   └── admin.guard.ts
│       │   ├── interceptors/
│       │   │   └── auth.interceptor.ts
│       │   └── services/
│       │       ├── auth.service.ts
│       │       ├── app-state.service.ts
│       │       └── toast.service.ts
│       ├── data/
│       │   ├── models/
│       │   │   ├── user.model.ts
│       │   │   ├── course.model.ts
│       │   │   ├── consultation.model.ts
│       │   │   ├── service.model.ts
│       │   │   ├── article.model.ts
│       │   │   ├── order.model.ts
│       │   │   ├── staff.model.ts
│       │   │   ├── general-info.model.ts
│       │   │   └── index.ts          ← barrel export
│       │   └── services/
│       │       ├── api.service.ts
│       │       ├── course.service.ts
│       │       ├── consultation.service.ts
│       │       ├── service-catalog.service.ts
│       │       ├── article.service.ts
│       │       ├── order.service.ts
│       │       └── landing.service.ts
│       ├── features/
│       │   ├── home/
│       │   │   ├── home.component.ts
│       │   │   ├── home.component.html
│       │   │   ├── home.component.scss
│       │   │   └── components/
│       │   │       ├── hero/
│       │   │       ├── courses-preview/
│       │   │       ├── staff-section/
│       │   │       └── about-section/
│       │   ├── courses/
│       │   ├── consultations/
│       │   │   ├── consultations.component.ts
│       │   │   └── detail/
│       │   │       └── consultation-detail.component.ts
│       │   ├── services/
│       │   ├── articles/
│       │   ├── profile/
│       │   ├── auth/
│       │   │   ├── login/
│       │   │   ├── register/
│       │   │   └── verify-email/
│       │   └── admin/
│       │       ├── admin.routes.ts
│       │       ├── dashboard/
│       │       └── courses/
│       └── shared/
│           ├── components/
│           │   ├── header/
│           │   ├── footer/
│           │   ├── course-card/
│           │   ├── consultation-card/
│           │   ├── service-card/
│           │   ├── order-card/
│           │   └── loading-spinner/
│           └── pipes/
│               ├── safe-html.pipe.ts
│               └── order-status.pipe.ts
├── angular.json
├── tsconfig.json
└── package.json
```

---

## app.config.ts — Application Bootstrap

```typescript
// src/app/app.config.ts
import { ApplicationConfig } from '@angular/core';
import { provideRouter, withComponentInputBinding, withViewTransitions } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { routes } from './app.routes';
import { authInterceptor } from './core/interceptors/auth.interceptor';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(
      routes,
      withComponentInputBinding(),  // route params as @Input()
      withViewTransitions(),         // smooth page transitions
    ),
    provideHttpClient(
      withInterceptors([authInterceptor]),
    ),
    provideAnimations(),
  ],
};
```

---

## app.component.ts — Root Component

```typescript
// src/app/app.component.ts
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from './shared/components/header/header.component';
import { FooterComponent } from './shared/components/footer/footer.component';

@Component({
  standalone: true,
  selector: 'app-root',
  template: `
    <app-header />
    <main class="main-content">
      <router-outlet />
    </main>
    <app-footer />
  `,
  styleUrls: ['./app.component.scss'],
  imports: [RouterOutlet, HeaderComponent, FooterComponent],
})
export class AppComponent {}
```

---

## Generate Components via CLI

```bash
# Component
ng g c features/home/home
ng g c features/courses/courses
ng g c shared/components/header/header
ng g c shared/components/course-card/course-card

# Service
ng g s data/services/course
ng g s core/services/auth

# Guard
ng g guard core/guards/auth --functional

# Pipe
ng g pipe shared/pipes/safe-html
```

---

## Further Reading

- [Angular CLI Reference](https://angular.dev/tools/cli) — all CLI commands
- [Project Structure Guide](https://angular.dev/reference/configs/file-structure)
- [tsconfig Reference](https://www.typescriptlang.org/tsconfig) — all compiler options
- [Angular University: App Setup Best Practices](https://blog.angular-university.io/angular-application-setup/)

---

> **Next:** [02 — Environments & Config](02_environments.md)
