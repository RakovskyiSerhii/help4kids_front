# 07 — Angular Router

> **Prev:** [06 — Services & DI](06_services_di.md) | **Next:** [08 — HttpClient](08_http_client.md)

The Angular Router maps almost 1:1 to GoRouter. You define routes as a flat or nested array, use guards instead of `redirect`, and navigate imperatively or declaratively.

---

## Route Definition

```typescript
// app.routes.ts — equivalent of lib/core/routing/router.dart
import { Routes } from '@angular/router';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'services', component: ServicesComponent },
  { path: 'courses', component: CoursesComponent },
  { path: 'consultations', component: ConsultationsComponent },
  { path: 'consultations/:id', component: ConsultationDetailComponent },  // path param
  { path: 'articles', component: ArticlesComponent },
  { path: 'verify/:token', component: VerifyEmailComponent },
  { path: 'payment/success', component: PaymentSuccessComponent },
  { path: '**', redirectTo: '' }  // wildcard — like GoRouter's errorBuilder
];
```

Register routes in `app.config.ts`:
```typescript
export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes, withComponentInputBinding()),  // withComponentInputBinding maps route params to @Input()
  ]
};
```

---

## Lazy Loading (code splitting)

Load component bundles only when the user navigates to that route — critical for web performance. Maps to Flutter's deferred component loading:

```typescript
// Lazy-load individual components
export const routes: Routes = [
  {
    path: '',
    loadComponent: () =>
      import('./features/home/home.component').then(m => m.HomeComponent),
  },
  {
    path: 'courses',
    loadComponent: () =>
      import('./features/courses/courses.component').then(m => m.CoursesComponent),
  },
  // Lazy-load a whole feature with its own sub-routes
  {
    path: 'admin',
    canActivate: [adminGuard],
    loadChildren: () =>
      import('./features/admin/admin.routes').then(m => m.adminRoutes),
  },
];

// features/admin/admin.routes.ts
export const adminRoutes: Routes = [
  { path: '', loadComponent: () => import('./dashboard/...').then(m => m.AdminDashboardComponent) },
  { path: 'courses/create', loadComponent: () => import('./courses/create/...').then(m => m.CreateCourseComponent) },
];
```

---

## `<router-outlet>` — The Placeholder

Place `<router-outlet>` where you want the matched route's component to render. Maps to GoRouter's shell routes and `child` placeholder:

```html
<!-- app.component.html -->
<app-header />
<main>
  <router-outlet />    <!-- current route component renders here -->
</main>
<app-footer />
```

---

## Declarative Navigation with `routerLink`

```html
<!-- Basic link — like GoRouter's context.push('/path') but declarative -->
<a routerLink="/courses">Courses</a>

<!-- Dynamic path — array segments are joined with / -->
<a [routerLink]="['/consultations', consultation.id]">View Details</a>

<!-- With query parameters — like GoRouter's extra/queryParams -->
<a [routerLink]="['/services']" [queryParams]="{ categoryId: cat.id }">
  {{ cat.name }}
</a>

<!-- Active link styling — automatic class when route matches -->
<a routerLink="/courses" routerLinkActive="nav-link--active">Courses</a>

<!-- Exact match only (don't mark /courses as active when on /courses/123) -->
<a routerLink="/courses" routerLinkActive="active" [routerLinkActiveOptions]="{ exact: true }">
  Courses
</a>
```

---

## Programmatic Navigation

```typescript
import { Router } from '@angular/router';

export class ConsultationsComponent {
  constructor(private router: Router) {}

  viewDetail(id: string): void {
    this.router.navigate(['/consultations', id]);
  }

  goToServicesWithFilter(categoryId: string): void {
    this.router.navigate(['/services'], {
      queryParams: { categoryId },
    });
  }

  // replaceUrl: true = like GoRouter's context.go() — no back button entry
  redirectAfterLogin(): void {
    this.router.navigate(['/profile'], { replaceUrl: true });
  }
}
```

---

## Reading Route Parameters

### Path parameters (`/consultations/:id`)

```typescript
import { ActivatedRoute } from '@angular/router';

export class ConsultationDetailComponent implements OnInit {
  consultation$!: Observable<Consultation>;

  constructor(
    private route: ActivatedRoute,
    private api: ApiService,
  ) {}

  ngOnInit(): void {
    // Snapshot — one-time read (fine when component re-creates on navigation)
    const id = this.route.snapshot.paramMap.get('id')!;
    this.consultation$ = this.api.getConsultationById(id);

    // Observable — reacts to param changes without recreating the component
    this.route.paramMap.subscribe(params => {
      const id = params.get('id')!;
      this.consultation$ = this.api.getConsultationById(id);
    });
  }
}
```

### Input binding (Angular 16+ — cleanest approach)

With `withComponentInputBinding()` in `provideRouter`, route params are automatically bound to `@Input()`:

```typescript
// Enable in app.config.ts:
provideRouter(routes, withComponentInputBinding())

// Then in component — params arrive as @Input()
export class ConsultationDetailComponent implements OnInit {
  @Input() id!: string;          // maps to :id path param automatically
  @Input() categoryId?: string;  // maps to ?categoryId query param

  consultation$!: Observable<Consultation>;

  constructor(private api: ApiService) {}

  ngOnInit(): void {
    this.consultation$ = this.api.getConsultationById(this.id);
  }
}
```

---

## Route Guards

Guards = GoRouter's `redirect` function. They run before navigation and can block or redirect.

```typescript
// auth.guard.ts — like GoRouter redirect for unauthenticated users
import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const authGuard: CanActivateFn = () => {
  const auth = inject(AuthService);
  const router = inject(Router);

  if (auth.isLoggedIn) return true;

  // Redirect and preserve the intended destination
  return router.createUrlTree(['/'], {
    queryParams: { returnUrl: router.url }
  });
};

// admin.guard.ts
export const adminGuard: CanActivateFn = () => {
  const auth = inject(AuthService);
  const router = inject(Router);

  if (auth.isAdmin) return true;
  return router.createUrlTree(['/']);
};
```

Apply guards in route definitions:
```typescript
{ path: 'profile', canActivate: [authGuard], loadComponent: ... },
{ path: 'admin', canActivate: [adminGuard], loadChildren: ... },
```

---

## Router Events (listening to navigation)

```typescript
import { NavigationStart, NavigationEnd, Router } from '@angular/router';
import { filter } from 'rxjs';

export class AppComponent {
  constructor(private router: Router) {
    router.events.pipe(
      filter(e => e instanceof NavigationEnd)
    ).subscribe(() => {
      window.scrollTo(0, 0);  // scroll to top on navigation
    });
  }
}
```

---

## Comparison Table: GoRouter vs Angular Router

| GoRouter | Angular Router |
|---|---|
| `GoRoute(path: '/x', builder: ...)` | `{ path: 'x', component: XComponent }` |
| `context.push('/x')` | `router.navigate(['/x'])` |
| `context.go('/x')` | `router.navigate(['/x'], { replaceUrl: true })` |
| `context.pop()` | `location.back()` |
| `GoRouterState.pathParameters['id']` | `route.snapshot.paramMap.get('id')` |
| `GoRouterState.uri.queryParameters` | `route.snapshot.queryParamMap.get('q')` |
| `redirect:` in GoRoute | `canActivate: [guard]` |
| Shell route | Nested routes with `<router-outlet>` |
| Deferred loading | `loadComponent` / `loadChildren` |
| `GoRouter.of(context).namedLocation` | `router.navigate(['/path'])` |

---

## Further Reading

- [Angular Router Guide](https://angular.dev/guide/routing) — official, comprehensive
- [Route Guards](https://angular.dev/guide/routing/common-router-tasks#preventing-unauthorized-access) — guards and resolvers
- [Lazy Loading](https://angular.dev/guide/routing/lazy-loading-ngmodules) — code splitting guide
- [withComponentInputBinding](https://angular.dev/api/router/withComponentInputBinding) — route params as @Input()
- [Angular Router Deep Dive — Angular University](https://blog.angular-university.io/angular-router/) — thorough blog series

---

> **Prev:** [06 — Services & DI](06_services_di.md) | **Next:** [08 — HttpClient](08_http_client.md)
