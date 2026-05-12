# 06 — Services & Dependency Injection

> **Prev:** [05 — Directives](05_directives.md) | **Next:** [07 — Angular Router](07_router.md)

This is where Angular really shines for you as a Flutter developer: **Dependency Injection is built in**. No `get_it`, no `injectable`, no code generation. Just annotate a class with `@Injectable` and inject it via constructors.

---

## What is a Service?

A service is a plain TypeScript class that handles business logic, data fetching, or state. Components should be thin — they read from services and trigger actions on them. This maps directly to your Cubit/Repository pattern:

```
Flutter                           Angular
────────────────────────────────────────────────────
Repository (CourseRepository)  →  Service (CourseService) — data fetching
Cubit (CoursesCubit)           →  Service (CoursesStateService) — state
ApiClient                      →  ApiService — raw HTTP
get_it.get<T>()                →  constructor(private svc: T) — injected by framework
@Singleton()                   →  @Injectable({ providedIn: 'root' })
@Injectable() (factory)        →  @Injectable() + provide in component
```

---

## Creating a Service

```bash
ng generate service data/services/course
# or:
ng g s data/services/course
```

```typescript
// course.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, map } from 'rxjs';
import { Course } from '../models/course.model';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'    // = @Singleton() or @LazySingleton() in GetIt
})
export class CourseService {
  private readonly url = `${environment.apiUrl}/api/courses`;

  private coursesSubject = new BehaviorSubject<Course[]>([]);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private errorSubject = new BehaviorSubject<string | null>(null);

  // Public read-only observables
  courses$ = this.coursesSubject.asObservable();
  loading$ = this.loadingSubject.asObservable();
  error$ = this.errorSubject.asObservable();
  featuredCourses$ = this.courses$.pipe(
    map(courses => courses.filter(c => c.featured))
  );

  constructor(private http: HttpClient) {}

  loadCourses(): void {
    this.loadingSubject.next(true);
    this.errorSubject.next(null);

    this.http.get<Course[]>(this.url).subscribe({
      next: courses => {
        this.coursesSubject.next(courses);
        this.loadingSubject.next(false);
      },
      error: err => {
        this.errorSubject.next(err.message);
        this.loadingSubject.next(false);
      }
    });
  }

  getCourseById(id: string): Observable<Course> {
    return this.http.get<Course>(`${this.url}/${id}`);
  }
}
```

---

## Injecting Services

Services are injected via the constructor — identical to Flutter's `injectable` constructor injection. The framework reads the types and provides the correct instances automatically:

```typescript
// In a component
@Component({ ... })
export class CoursesComponent implements OnInit {
  courses$ = this.courseService.courses$;
  loading$ = this.courseService.loading$;

  constructor(
    private courseService: CourseService,   // Angular resolves this automatically
    private router: Router,                 // built-in Angular service
    private dialog: MatDialog,              // Angular Material service
  ) {}

  ngOnInit(): void {
    this.courseService.loadCourses();
  }
}

// In another service — services can inject other services
@Injectable({ providedIn: 'root' })
export class OrderService {
  constructor(
    private http: HttpClient,
    private auth: AuthService,    // inject another service
  ) {}
}
```

---

## DI Scopes

| Angular | GetIt equivalent | Behaviour |
|---|---|---|
| `providedIn: 'root'` | `@Singleton()` / `@LazySingleton()` | One instance for entire app |
| `providers: [MyService]` in `@Component` | `@injectable` (factory) | New instance per component |
| `providers: [MyService]` in lazy-loaded route | — | Shared within that feature module |

```typescript
// Root singleton (most common)
@Injectable({ providedIn: 'root' })
export class AuthService {}

// Component-scoped (new instance per component — rarely needed)
@Component({
  providers: [FormStateService]  // fresh instance for this component tree
})
export class CheckoutComponent {}
```

---

## Injection Tokens

For injecting values (not classes) — like `getIt.registerInstance()`:

```typescript
// Define a token
import { InjectionToken } from '@angular/core';
export const API_URL = new InjectionToken<string>('API_URL');

// Register in app.config.ts
providers: [
  { provide: API_URL, useValue: environment.apiUrl },
]

// Inject with @Inject
@Injectable({ providedIn: 'root' })
export class ApiService {
  constructor(@Inject(API_URL) private apiUrl: string) {}
}
```

---

## The `inject()` Function (Angular 14+)

Outside of constructors (e.g., in guards and interceptors), use the functional `inject()`:

```typescript
import { inject } from '@angular/core';

// In a guard function
export const authGuard: CanActivateFn = () => {
  const auth = inject(AuthService);     // works in injection context
  const router = inject(Router);
  return auth.isLoggedIn ? true : router.createUrlTree(['/']);
};

// In an interceptor
export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const auth = inject(AuthService);
  // ...
};
```

---

## Service Design Patterns

### Pattern 1: Stateless Service (pure API wrapper)

```typescript
@Injectable({ providedIn: 'root' })
export class ArticleService {
  constructor(private http: HttpClient) {}

  getAll(): Observable<Article[]> {
    return this.http.get<Article[]>('/api/articles');
  }

  getById(id: string): Observable<Article> {
    return this.http.get<Article>(`/api/articles/${id}`);
  }
}
```

Good for detail screens where data isn't shared across components.

### Pattern 2: Stateful Service (like Cubit)

```typescript
@Injectable({ providedIn: 'root' })
export class LandingService {
  private state$ = new BehaviorSubject<LandingResponse | null>(null);
  data$ = this.state$.asObservable();

  constructor(private http: HttpClient) {
    this.load();  // auto-load on first injection — like AppCubit constructor
  }

  private load(): void {
    this.http.get<LandingResponse>('/api/landing')
      .subscribe(data => this.state$.next(data));
  }
}
```

### Pattern 3: Shared Auth State

```typescript
@Injectable({ providedIn: 'root' })
export class AuthService {
  private user$ = new BehaviorSubject<User | null>(null);

  isLoggedIn$ = this.user$.pipe(map(u => u !== null));
  currentUser$ = this.user$.asObservable();

  // Synchronous getter for guards
  get isLoggedIn(): boolean { return this.user$.getValue() !== null; }
  get currentUser(): User | null { return this.user$.getValue(); }
}
```

---

## Further Reading

- [Angular Dependency Injection](https://angular.dev/guide/di) — comprehensive official guide
- [inject() function](https://angular.dev/api/core/inject) — functional injection API
- [DI in practice](https://angular.dev/guide/di/dependency-injection-context) — injection context rules
- [Angular University: DI Deep Dive](https://blog.angular-university.io/angular-dependency-injection/) — thorough blog post

---

> **Prev:** [05 — Directives](05_directives.md) | **Next:** [07 — Angular Router](07_router.md)
