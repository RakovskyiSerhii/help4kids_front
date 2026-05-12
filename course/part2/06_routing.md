# Part 2 — 06: Routing Architecture

> **Prev:** [05 — Auth Module](05_auth.md) | **Next:** [07 — State Management](07_state.md)

**Flutter:** `lib/core/routing/router.dart` (GoRouter) + `lib/core/routing/screens.dart`
**Angular:** `app.routes.ts` + `features/admin/admin.routes.ts`

---

## Complete Route Definitions

```typescript
// src/app/app.routes.ts
import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth.guard';
import { adminGuard } from './core/guards/admin.guard';

export const routes: Routes = [
  // ── Public routes ─────────────────────────────────────────────────
  {
    path: '',
    loadComponent: () =>
      import('./features/home/home.component').then(m => m.HomeComponent),
    title: 'Help4Kids — Home',
  },
  {
    path: 'services',
    loadComponent: () =>
      import('./features/services/services.component').then(m => m.ServicesComponent),
    title: 'Services',
  },
  {
    path: 'courses',
    loadComponent: () =>
      import('./features/courses/courses.component').then(m => m.CoursesComponent),
    title: 'Courses',
  },
  {
    path: 'consultations',
    loadComponent: () =>
      import('./features/consultations/consultations.component').then(m => m.ConsultationsComponent),
    title: 'Consultations',
  },
  {
    path: 'consultations/:id',
    loadComponent: () =>
      import('./features/consultations/detail/consultation-detail.component')
        .then(m => m.ConsultationDetailComponent),
  },
  {
    path: 'articles',
    loadComponent: () =>
      import('./features/articles/articles.component').then(m => m.ArticlesComponent),
    title: 'Articles',
  },
  {
    path: 'nevidkladna-dopomoga',
    loadComponent: () =>
      import('./features/emergency/emergency.component').then(m => m.EmergencyComponent),
    title: 'Emergency Help',
  },

  // ── Auth routes ───────────────────────────────────────────────────
  {
    path: 'verify/:token',
    loadComponent: () =>
      import('./features/auth/verify-email/verify-email.component')
        .then(m => m.VerifyEmailComponent),
    title: 'Verify Email',
  },
  {
    path: 'register',
    loadComponent: () =>
      import('./features/auth/register/register.component').then(m => m.RegisterComponent),
    title: 'Register',
  },

  // ── Protected routes (require login) ──────────────────────────────
  {
    path: 'profile',
    canActivate: [authGuard],
    loadComponent: () =>
      import('./features/profile/profile.component').then(m => m.ProfileComponent),
    title: 'My Profile',
  },
  {
    path: 'payment/success',
    canActivate: [authGuard],
    loadComponent: () =>
      import('./features/payment-success/payment-success.component')
        .then(m => m.PaymentSuccessComponent),
    title: 'Payment Successful',
  },

  // ── Admin routes (require admin role) ────────────────────────────
  {
    path: 'admin',
    canActivate: [adminGuard],
    loadChildren: () =>
      import('./features/admin/admin.routes').then(m => m.adminRoutes),
  },

  // ── Maintenance ───────────────────────────────────────────────────
  {
    path: 'maintenance',
    loadComponent: () =>
      import('./features/maintenance/maintenance.component').then(m => m.MaintenanceComponent),
  },

  // ── Fallback ──────────────────────────────────────────────────────
  { path: '**', redirectTo: '' },
];
```

```typescript
// src/app/features/admin/admin.routes.ts
import { Routes } from '@angular/router';

export const adminRoutes: Routes = [
  {
    path: '',
    loadComponent: () =>
      import('./dashboard/admin-dashboard.component').then(m => m.AdminDashboardComponent),
    title: 'Admin Dashboard',
  },
  {
    path: 'courses/create',
    loadComponent: () =>
      import('./courses/create/create-course.component').then(m => m.CreateCourseComponent),
    title: 'Create Course',
  },
  {
    path: 'courses/edit/:id',
    loadComponent: () =>
      import('./courses/edit/edit-course.component').then(m => m.EditCourseComponent),
    title: 'Edit Course',
  },
  {
    path: 'consultations/create',
    loadComponent: () =>
      import('./consultations/create/create-consultation.component')
        .then(m => m.CreateConsultationComponent),
  },
  {
    path: 'consultations/edit/:id',
    loadComponent: () =>
      import('./consultations/edit/edit-consultation.component')
        .then(m => m.EditConsultationComponent),
  },
  {
    path: 'articles/create',
    loadComponent: () =>
      import('./articles/create/create-article.component').then(m => m.CreateArticleComponent),
  },
  {
    path: 'articles/edit/:id',
    loadComponent: () =>
      import('./articles/edit/edit-article.component').then(m => m.EditArticleComponent),
  },
];
```

---

## Route Constants (like `screens.dart`)

```typescript
// src/app/app.routes.names.ts
export const Routes = {
  home: '/',
  services: '/services',
  courses: '/courses',
  consultations: '/consultations',
  consultationDetail: (id: string) => `/consultations/${id}`,
  articles: '/articles',
  profile: '/profile',
  verifyEmail: (token: string) => `/verify/${token}`,
  paymentSuccess: '/payment/success',
  admin: '/admin',
  adminCreateCourse: '/admin/courses/create',
  adminEditCourse: (id: string) => `/admin/courses/edit/${id}`,
} as const;
```

```typescript
// Usage
this.router.navigateByUrl(AppRoutes.consultationDetail(id));
```

---

## Page Titles (SEO — Angular 14+)

The `title` property in route definitions automatically updates `<title>` in `<head>`. For dynamic titles:

```typescript
// consultation-detail.component.ts
import { Title } from '@angular/platform-browser';

ngOnInit(): void {
  const id = this.route.snapshot.paramMap.get('id')!;
  this.api.getConsultationById(id).subscribe(c => {
    this.consultation = c;
    this.titleService.setTitle(`${c.title} — Help4Kids`);
  });
}
```

---

## Query Parameters (Services page with category filter)

```typescript
// services.component.ts
export class ServicesComponent implements OnInit {
  // Reactive query param — updates when URL changes
  categoryId$ = this.route.queryParamMap.pipe(
    map(params => params.get('categoryId'))
  );

  services$ = this.categoryId$.pipe(
    switchMap(categoryId => this.api.getServices(categoryId ?? undefined))
  );

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private api: ApiService,
  ) {}

  filterByCategory(categoryId: string): void {
    this.router.navigate(['/services'], {
      queryParams: { categoryId },
      queryParamsHandling: 'merge',  // keep other query params
    });
  }

  clearFilter(): void {
    this.router.navigate(['/services']);
  }
}
```

---

## GoRouter vs Angular Router — Full Comparison

| GoRouter | Angular Router |
|---|---|
| `GoRoute(path: '/x', builder: (_, __) => XScreen())` | `{ path: 'x', loadComponent: () => import('./x').then(m => m.X) }` |
| `context.push('/x')` | `router.navigate(['/x'])` |
| `context.go('/x')` | `router.navigate(['/x'], { replaceUrl: true })` |
| `context.pop()` | `location.back()` |
| `context.pushNamed(Screen.consultation, params: {'id': id})` | `router.navigate(['/consultations', id])` |
| `GoRouterState.pathParameters['id']` | `route.snapshot.paramMap.get('id')` or `@Input() id!: string` |
| `GoRouterState.uri.queryParameters['categoryId']` | `route.snapshot.queryParamMap.get('categoryId')` |
| `redirect:` on GoRoute | `canActivate: [guard]` |
| Nested shell routes | Nested routes with child `<router-outlet>` |
| `pageBuilder` with no transition | Use `withViewTransitions()` or CSS transitions |
| Named routes + `namedLocation()` | Route constants + `router.navigate()` |

---

## Further Reading

- [Angular Router Guide](https://angular.dev/guide/routing)
- [Lazy Loading with loadComponent](https://angular.dev/guide/routing/lazy-loading-ngmodules)
- [Route Titles](https://angular.dev/guide/routing/common-router-tasks#setting-the-page-title)
- [withComponentInputBinding](https://angular.dev/api/router/withComponentInputBinding)

---

> **Prev:** [05 — Auth Module](05_auth.md) | **Next:** [07 — State Management](07_state.md)
