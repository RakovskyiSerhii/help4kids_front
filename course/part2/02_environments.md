# Part 2 — 02: Environments & Config

> **Prev:** [01 — Project Setup](01_project_setup.md) | **Next:** [03 — Data Models](03_models.md)

**Flutter:** `lib/core/config/app_config.dart`
**Angular:** `src/environments/environment.ts` + `environment.prod.ts`

---

## Flutter AppConfig → Angular environments

Your current Flutter config:
```dart
// lib/core/config/app_config.dart
class AppConfig {
  static const String apiBaseUrl = 'http://173.242.53.114:8080';
  static const bool enableDebugLogging = true;
}
```

Angular equivalent:

```typescript
// src/environments/environment.ts  (development)
export const environment = {
  production: false,
  apiUrl: 'http://173.242.53.114:8080',
  enableDebugLogging: true,
  maintenanceToken: 'help4kids-maintenance-2024',
};
```

```typescript
// src/environments/environment.prod.ts  (production)
export const environment = {
  production: true,
  apiUrl: '',               // empty = same domain, Nginx proxies /api/*
  enableDebugLogging: false,
  maintenanceToken: '',
};
```

Angular automatically swaps the file at build time:
- `ng serve` → uses `environment.ts`
- `ng build --configuration production` → replaces with `environment.prod.ts`

This is configured in `angular.json`:
```json
"configurations": {
  "production": {
    "fileReplacements": [
      {
        "replace": "src/environments/environment.ts",
        "with": "src/environments/environment.prod.ts"
      }
    ]
  }
}
```

---

## Using the Environment

```typescript
// In a service
import { environment } from '../../../environments/environment';

@Injectable({ providedIn: 'root' })
export class ApiService {
  private baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) {
    if (environment.enableDebugLogging) {
      console.log('ApiService initialized, baseUrl:', this.baseUrl);
    }
  }
}
```

---

## Multiple Environments (staging)

```typescript
// src/environments/environment.staging.ts
export const environment = {
  production: false,
  apiUrl: 'https://api-staging.help4kids.com',
  enableDebugLogging: true,
  maintenanceToken: 'staging-token',
};
```

Add to `angular.json`:
```json
"configurations": {
  "staging": {
    "fileReplacements": [
      {
        "replace": "src/environments/environment.ts",
        "with": "src/environments/environment.staging.ts"
      }
    ]
  }
}
```

Build with: `ng build --configuration staging`

---

## Environment Injection Token (best practice)

For testability, provide the environment via Angular DI instead of importing it directly:

```typescript
// src/environments/environment.token.ts
import { InjectionToken } from '@angular/core';
import { environment } from './environment';

export interface Environment {
  production: boolean;
  apiUrl: string;
  enableDebugLogging: boolean;
}

export const ENVIRONMENT = new InjectionToken<Environment>('Environment', {
  factory: () => environment,
});
```

```typescript
// app.config.ts
import { ENVIRONMENT } from '../environments/environment.token';
import { environment } from '../environments/environment';

export const appConfig: ApplicationConfig = {
  providers: [
    { provide: ENVIRONMENT, useValue: environment },
    ...
  ]
};
```

```typescript
// In services — injected, easy to mock in tests
@Injectable({ providedIn: 'root' })
export class ApiService {
  constructor(
    private http: HttpClient,
    @Inject(ENVIRONMENT) private env: Environment,
  ) {}

  getCourses() {
    return this.http.get<Course[]>(`${this.env.apiUrl}/api/courses`);
  }
}
```

---

## Base URL Interceptor

Rather than prepending `environment.apiUrl` in every service method, use an interceptor:

```typescript
// src/app/core/interceptors/base-url.interceptor.ts
import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { ENVIRONMENT } from '../../../environments/environment.token';

export const baseUrlInterceptor: HttpInterceptorFn = (req, next) => {
  const env = inject(ENVIRONMENT);

  // Only prefix relative URLs (skip absolute ones like CDN or payment provider)
  if (!req.url.startsWith('http') && env.apiUrl) {
    return next(req.clone({ url: `${env.apiUrl}${req.url}` }));
  }

  return next(req);
};
```

With this interceptor, your services use simple relative paths:
```typescript
// Clean — no env prefix needed in every method
getCourses() { return this.http.get<Course[]>('/api/courses'); }
getStaff()   { return this.http.get<Staff[]>('/api/staff'); }
```

---

## Further Reading

- [Build Environments in Angular](https://angular.dev/tools/cli/environments) — official guide
- [InjectionToken](https://angular.dev/api/core/InjectionToken) — typed DI tokens

---

> **Prev:** [01 — Project Setup](01_project_setup.md) | **Next:** [03 — Data Models](03_models.md)
