# 02 — Angular Architecture Overview

> **Prev:** [01 — TypeScript](01_typescript.md) | **Next:** [03 — Components](03_components.md)

Before writing any Angular code, you need a mental model of how everything fits together. This module maps every piece of Flutter's architecture to its Angular equivalent.

---

## Flutter vs Angular Mental Model

```
Flutter                              Angular
────────────────────────────────────────────────────────────
Widget                         →     Component
Widget tree                    →     Component tree (renders to DOM)
MaterialApp (root widget)      →     AppComponent + provideRouter()
pubspec.yaml                   →     package.json
flutter pub get                →     npm install
flutter run -d chrome          →     ng serve
flutter build web              →     ng build --configuration production
GoRouter                       →     Angular Router
BLoC / Cubit                   →     Service + RxJS BehaviorSubject
GetIt / injectable             →     Angular DI (zero packages needed)
Dio + interceptors             →     HttpClient + HttpInterceptorFn
@freezed model                 →     TypeScript interface
flutter_bloc BlocBuilder       →     {{ observable$ | async }} in template
flutter_bloc BlocProvider      →     constructor injection (no tree needed)
StatefulWidget                 →     Component with ngOnInit/ngOnDestroy
StatelessWidget                →     Component (no local state)
BuildContext                   →     (gone — services injected via constructor)
ThemeData                      →     Angular Material theme + CSS variables
MediaQuery.of(context)         →     CSS media queries / CDK BreakpointObserver
flutter_localizations          →     Angular i18n or Transloco
assets in pubspec.yaml         →     files in src/assets/, referenced by path
```

---

## Application Bootstrap

**Flutter entry point:**
```dart
void main() {
  configureDependencies();
  runApp(const AppWidget());
}
```

**Angular entry point:**
```typescript
// src/main.ts
import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';

bootstrapApplication(AppComponent, appConfig);
```

```typescript
// src/app/app.config.ts — equivalent of configureDependencies() + MaterialApp config
import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { routes } from './app.routes';
import { authInterceptor } from './core/interceptors/auth.interceptor';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient(withInterceptors([authInterceptor])),
    provideAnimations(),
  ],
};
```

---

## Application Directory Structure

```
src/
├── main.ts                         ← bootstrap
├── index.html                      ← shell HTML (Angular inserts <app-root> here)
├── styles.scss                     ← global styles + Material theme
├── environments/
│   ├── environment.ts              ← dev config (AppConfig equivalent)
│   └── environment.prod.ts         ← prod config
└── app/
    ├── app.component.ts            ← root component (= MaterialApp widget)
    ├── app.component.html          ← <router-outlet> lives here
    ├── app.config.ts               ← providers (DI registrations)
    ├── app.routes.ts               ← route definitions
    ├── core/                       ← singleton services, guards, interceptors
    │   ├── services/
    │   ├── guards/
    │   └── interceptors/
    ├── data/                       ← models + API services
    │   ├── models/
    │   └── services/
    ├── features/                   ← one folder per page/feature
    │   ├── home/
    │   ├── courses/
    │   ├── consultations/
    │   ├── services/
    │   ├── articles/
    │   ├── profile/
    │   ├── auth/
    │   └── admin/
    └── shared/                     ← reusable components and pipes
        ├── components/
        └── pipes/
```

---

## Standalone Components (Angular 17+)

Older Angular required every component to be declared in an `NgModule` — a lot of boilerplate. Modern Angular (17+) uses **standalone components**: each component declares its own imports. Think of it exactly like a Flutter Widget that imports the packages it needs.

```typescript
// Old way — NgModule (you may see this in older projects)
@NgModule({
  declarations: [HomeComponent],
  imports: [CommonModule, RouterModule],
})
export class HomeModule {}

// Modern way — standalone (what you will write)
@Component({
  standalone: true,
  selector: 'app-home',
  imports: [CommonModule, RouterLink, MatButtonModule],  // self-contained
  templateUrl: './home.component.html',
})
export class HomeComponent {}
```

---

## How Angular Renders

1. Browser loads `index.html`, which contains `<app-root></app-root>`
2. Angular bootstraps `AppComponent` into that element
3. `AppComponent` template contains `<router-outlet>` — a placeholder Angular fills with the matched route's component
4. Each component renders its HTML template, binding TypeScript properties to the DOM
5. Change detection updates the DOM when data changes

```html
<!-- src/index.html -->
<body>
  <app-root></app-root>  <!-- Angular replaces this with AppComponent -->
</body>
```

```html
<!-- src/app/app.component.html -->
<app-header />
<main>
  <router-outlet />   <!-- current route's component renders here -->
</main>
<app-footer />
```

---

## Change Detection

Angular automatically detects when component data changes and updates the DOM. Two strategies:

**Default** — checks the entire component tree on every event (user interaction, HTTP response, setTimeout). Simple but can be slow for large apps.

**OnPush** — only checks when an `@Input()` reference changes or an Observable emits. Faster; recommended when using Observables (which you will be).

```typescript
@Component({
  changeDetection: ChangeDetectionStrategy.OnPush,  // add this for performance
  ...
})
export class CourseCardComponent {}
```

With `OnPush` + the `async` pipe, Angular only re-renders when your Observable emits — exactly like Flutter's `BlocBuilder` only rebuilding when state changes.

---

## Compilation: AOT vs JIT

Angular compiles your HTML templates at **build time** (AOT — Ahead of Time). This means:
- Templates are type-checked (typos in `[property]` bindings are compile errors)
- The browser receives pre-compiled, smaller bundles
- No template compiler shipped to the client

This is equivalent to Flutter's AOT compilation for release builds.

---

## The `@Component` Decorator — Full Anatomy

```typescript
@Component({
  standalone: true,                          // no NgModule needed
  selector: 'app-course-card',              // used as <app-course-card /> in HTML
  templateUrl: './course-card.component.html',
  styleUrls: ['./course-card.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [                                 // what this component's template needs
    CommonModule,
    RouterLink,
    AsyncPipe,
    MatCardModule,
    MatButtonModule,
    CurrencyPipe,
  ],
})
export class CourseCardComponent {
  @Input() course!: Course;
  @Output() buy = new EventEmitter<Course>();
}
```

---

## Further Reading

- [Angular Architecture Overview](https://angular.dev/essentials) — official guide
- [Standalone Components](https://angular.dev/guide/components/importing) — official migration guide and explanation
- [Angular Application Structure](https://angular.dev/reference/configs/file-structure) — recommended file structure
- [Change Detection in Angular](https://angular.dev/best-practices/skipping-subtrees) — OnPush strategy deep dive
- [Angular University: Standalone Components](https://blog.angular-university.io/angular-standalone-components/) — practical walkthrough

---

> **Prev:** [01 — TypeScript](01_typescript.md) | **Next:** [03 — Components](03_components.md)
