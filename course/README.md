# Angular Course: Flutter Dev → Angular + Help4Kids Migration

> You are a Flutter developer building a Kotlin/Spring Boot backend. This course maps every Flutter concept you already know to its Angular equivalent, then walks you through migrating the Help4Kids pediatric clinic website from Flutter Web to Angular step by step.

---

## Prerequisites

- Flutter/Dart experience (you have this)
- Basic understanding of HTML and CSS
- Node.js installed (`node -v` should be ≥ 18)
- Angular CLI: `npm install -g @angular/cli`

---

## Part 1 — Angular Fundamentals

| # | Module | What you'll learn |
|---|--------|-------------------|
| 01 | [TypeScript for Dart Developers](part1/01_typescript.md) | Types, interfaces, generics, decorators, utility types |
| 02 | [Angular Architecture](part1/02_architecture.md) | Components, modules, standalone API, change detection |
| 03 | [Components — Angular's Widgets](part1/03_components.md) | @Input/@Output, lifecycle hooks, view encapsulation |
| 04 | [Templates & Data Binding](part1/04_templates.md) | Interpolation, property/event/two-way binding, pipes |
| 05 | [Directives](part1/05_directives.md) | *ngIf, *ngFor, new @if/@for syntax, custom directives |
| 06 | [Services & Dependency Injection](part1/06_services_di.md) | @Injectable, DI scopes, injection tokens |
| 07 | [Angular Router](part1/07_router.md) | Routes, lazy loading, guards, query/path params |
| 08 | [HttpClient](part1/08_http_client.md) | GET/POST/PUT/DELETE, interceptors, error handling |
| 09 | [RxJS — Streams on Steroids](part1/09_rxjs.md) | Observable, Subject, operators, async pipe |
| 10 | [State Management](part1/10_state_management.md) | BehaviorSubject pattern, Signals, NgRx overview |
| 11 | [Forms](part1/11_forms.md) | Template-driven, reactive forms, validators |
| 12 | [Angular Material](part1/12_angular_material.md) | Setup, components, theming, Flutter equivalents |

---

## Part 2 — Help4Kids Migration

| # | Module | What you'll learn |
|---|--------|-------------------|
| 01 | [Project Setup](part2/01_project_setup.md) | ng new, directory structure, package.json |
| 02 | [Environments & Config](part2/02_environments.md) | Replacing AppConfig with Angular environments |
| 03 | [Data Models](part2/03_models.md) | Replacing Freezed with TypeScript interfaces |
| 04 | [API Service Layer](part2/04_api_service.md) | Replacing Dio ApiClient with HttpClient |
| 05 | [Auth Module](part2/05_auth.md) | Replacing ValueCarrier + AuthBloc with AuthService |
| 06 | [Routing Architecture](part2/06_routing.md) | Replacing GoRouter with Angular Router |
| 07 | [State Management Strategy](part2/07_state.md) | Replacing Cubits with Service + BehaviorSubject |
| 08 | [Migrating Feature Screens](part2/08_screens.md) | Home, Courses, Consultations, Services, Profile |
| 09 | [Admin Module](part2/09_admin.md) | Admin dashboard, CRUD forms, file upload |
| 10 | [Shared Components](part2/10_shared.md) | Header, Footer, cards, pipes |
| 11 | [Responsive Design](part2/11_responsive.md) | CSS grid, CDK BreakpointObserver |
| 12 | [Localization](part2/12_localization.md) | Replacing intl/.arb with Transloco |
| 13 | [Deployment](part2/13_deployment.md) | ng build, Nginx config, deploy script |

---

## Recommended Learning Path

```
Week 1:  Part 1 → modules 01–03  (TypeScript, architecture, components)
Week 2:  Part 1 → modules 04–06  (binding, directives, services/DI)
Week 3:  Part 1 → modules 07–09  (router, HTTP, RxJS)
Week 4:  Part 1 → modules 10–12  (state, forms, Material)
Week 5:  Part 2 → modules 01–04  (project setup through API layer)
Week 6:  Part 2 → modules 05–07  (auth, routing, state)
Week 7:  Part 2 → modules 08–10  (screens, admin, shared)
Week 8:  Part 2 → modules 11–13  (responsive, i18n, deploy)
```

## Key Mindset Shift

In Flutter you compose widgets into a tree. In Angular you compose HTML with data binding. Logic lives in **services** (not components), and **Observables** replace Dart Streams. Your Cubit knowledge maps almost perfectly to Services + BehaviorSubject — that is your biggest head start.

---

## Essential Links

- [Angular Official Docs](https://angular.dev) — the authoritative reference
- [Angular Material](https://material.angular.io) — UI component library
- [RxJS](https://rxjs.dev) — reactive streams used throughout Angular
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)
- [Angular University Blog](https://blog.angular-university.io) — deep-dive articles
