# Part 2 — 07: State Management Strategy

> **Prev:** [06 — Routing](06_routing.md) | **Next:** [08 — Migrating Screens](08_screens.md)

This module shows the complete state pattern for every service in Help4Kids, mapping each Flutter Cubit to its Angular Service + BehaviorSubject equivalent.

---

## The Base Pattern

Define a reusable state shape (replaces your `Result<T>` type):

```typescript
// src/app/shared/models/async-state.model.ts
export interface AsyncState<T> {
  data: T | null;
  loading: boolean;
  error: string | null;
}

export const initialAsyncState = <T>(): AsyncState<T> => ({
  data: null, loading: false, error: null,
});

// Abstract base service — like BaseRepository but for state
// (optional — you can inline everything if you prefer)
```

---

## AppStateService (= AppCubit)

```typescript
// src/app/core/services/app-state.service.ts
@Injectable({ providedIn: 'root' })
export class AppStateService {
  private infoSubject = new BehaviorSubject<GeneralInfo | null>(null);
  private loadingSubject = new BehaviorSubject(false);

  info$ = this.infoSubject.asObservable();
  loading$ = this.loadingSubject.asObservable();
  categories$ = this.info$.pipe(map(i => i?.categories ?? []));
  socialContacts$ = this.info$.pipe(map(i => i?.socialContacts ?? []));
  units$ = this.info$.pipe(map(i => i?.units ?? []));

  constructor(private api: ApiService) {
    this.loadGeneralInfo();   // auto-loads on first injection — same as AppCubit constructor
  }

  private loadGeneralInfo(): void {
    this.loadingSubject.next(true);
    this.api.getGeneralInfo().subscribe({
      next: info => {
        this.infoSubject.next(info);
        this.loadingSubject.next(false);
      },
      error: () => this.loadingSubject.next(false),
    });
  }
}
```

---

## LandingService (= HomeCubit)

```typescript
// src/app/data/services/landing.service.ts
@Injectable({ providedIn: 'root' })
export class LandingService {
  private state$ = new BehaviorSubject<AsyncState<LandingResponse>>(initialAsyncState());

  landing$ = this.state$.pipe(map(s => s.data));
  loading$ = this.state$.pipe(map(s => s.loading));
  error$ = this.state$.pipe(map(s => s.error));
  featuredCourses$ = this.landing$.pipe(map(l => l?.featuredCourses ?? []));
  featuredConsultations$ = this.landing$.pipe(map(l => l?.featuredConsultations ?? []));
  staff$ = this.landing$.pipe(map(l => l?.staff ?? []));

  constructor(private api: ApiService) {}

  load(): void {
    if (this.state$.getValue().data) return;   // don't reload if already loaded
    this.patch({ loading: true, error: null });

    this.api.getLanding().subscribe({
      next: data => this.patch({ data, loading: false }),
      error: err => this.patch({ error: err.message, loading: false }),
    });
  }

  private patch(p: Partial<AsyncState<LandingResponse>>): void {
    this.state$.next({ ...this.state$.getValue(), ...p });
  }
}
```

---

## CourseService (= CoursesCubit)

```typescript
// src/app/data/services/course.service.ts
@Injectable({ providedIn: 'root' })
export class CourseService {
  private state$ = new BehaviorSubject<AsyncState<Course[]>>(initialAsyncState());

  courses$ = this.state$.pipe(map(s => s.data ?? []));
  loading$ = this.state$.pipe(map(s => s.loading));
  error$ = this.state$.pipe(map(s => s.error));
  myCourses$ = new BehaviorSubject<Course[]>([]);

  constructor(private api: ApiService) {}

  loadCourses(): void {
    this.patch({ loading: true, error: null });
    this.api.getCourses().subscribe({
      next: data => this.patch({ data, loading: false }),
      error: err => this.patch({ error: err.message, loading: false }),
    });
  }

  loadMyCourses(): void {
    this.api.getMyCourses().subscribe(courses => this.myCourses$.next(courses));
  }

  private patch(p: Partial<AsyncState<Course[]>>): void {
    this.state$.next({ ...this.state$.getValue(), ...p });
  }
}
```

---

## ConsultationService (= ConsultationDetailCubit)

```typescript
// src/app/data/services/consultation.service.ts
@Injectable({ providedIn: 'root' })
export class ConsultationService {
  private listState$ = new BehaviorSubject<AsyncState<Consultation[]>>(initialAsyncState());

  consultations$ = this.listState$.pipe(map(s => s.data ?? []));
  loading$ = this.listState$.pipe(map(s => s.loading));

  constructor(private api: ApiService) {}

  loadConsultations(): void {
    this.listState$.next({ loading: true, data: null, error: null });
    this.api.getConsultations().subscribe({
      next: data => this.listState$.next({ data, loading: false, error: null }),
      error: err => this.listState$.next({ data: null, loading: false, error: err.message }),
    });
  }

  getById(id: string): Observable<Consultation> {
    return this.api.getConsultationById(id);   // stateless — detail pages are one-shot
  }
}
```

---

## ServiceCatalogService (= ServicesCubit)

```typescript
// src/app/data/services/service-catalog.service.ts
@Injectable({ providedIn: 'root' })
export class ServiceCatalogService {
  private state$ = new BehaviorSubject<AsyncState<Service[]>>(initialAsyncState());

  services$ = this.state$.pipe(map(s => s.data ?? []));
  loading$ = this.state$.pipe(map(s => s.loading));

  // Filter services by category (replaces ServicesState.categories + filter logic)
  filteredServices$(categoryId: string | null): Observable<Service[]> {
    return this.services$.pipe(
      map(services =>
        categoryId ? services.filter(s => s.categoryId === categoryId) : services
      )
    );
  }

  constructor(private api: ApiService) {}

  loadServices(): void {
    if (this.state$.getValue().data) return;
    this.state$.next({ loading: true, data: null, error: null });
    this.api.getServices().subscribe({
      next: data => this.state$.next({ data, loading: false, error: null }),
      error: err => this.state$.next({ data: null, loading: false, error: err.message }),
    });
  }
}
```

---

## OrderService (= part of ProfileCubit)

```typescript
// src/app/data/services/order.service.ts
@Injectable({ providedIn: 'root' })
export class OrderService {
  private myOrdersSubject = new BehaviorSubject<Order[]>([]);
  myOrders$ = this.myOrdersSubject.asObservable();

  constructor(private api: ApiService) {}

  loadMyOrders(): void {
    this.api.getMyOrders().subscribe(orders => this.myOrdersSubject.next(orders));
  }

  createOrder(data: CreateOrderDto): Observable<Order> {
    return this.api.createOrder(data).pipe(
      tap(() => this.loadMyOrders())  // refresh orders after creation
    );
  }
}
```

---

## ProfileService (= ProfileCubit)

```typescript
// src/app/data/services/profile.service.ts
@Injectable({ providedIn: 'root' })
export class ProfileService {
  // Profile = combination of AuthService.user$ + OrderService + CourseService
  // No separate ProfileCubit needed — compose existing services

  constructor(
    private auth: AuthService,
    private orderService: OrderService,
    private courseService: CourseService,
  ) {}

  loadProfileData(): void {
    this.orderService.loadMyOrders();
    this.courseService.loadMyCourses();
  }
}
```

---

## AdminService (= AdminCubit)

```typescript
// src/app/data/services/admin.service.ts
@Injectable({ providedIn: 'root' })
export class AdminService {
  private savingSubject = new BehaviorSubject(false);
  saving$ = this.savingSubject.asObservable();

  constructor(
    private api: ApiService,
    private toast: ToastService,
    private router: Router,
  ) {}

  createCourse(data: CreateCourseDto): void {
    this.savingSubject.next(true);
    this.api.createCourse(data).subscribe({
      next: () => {
        this.toast.success('Course created!');
        this.savingSubject.next(false);
        this.router.navigate(['/admin']);
      },
      error: err => {
        this.toast.error('Failed to create course: ' + err.message);
        this.savingSubject.next(false);
      },
    });
  }

  updateCourse(id: string, data: UpdateCourseDto): void {
    this.savingSubject.next(true);
    this.api.updateCourse(id, data).subscribe({
      next: () => {
        this.toast.success('Course updated!');
        this.savingSubject.next(false);
        this.router.navigate(['/admin']);
      },
      error: () => {
        this.toast.error('Failed to update course');
        this.savingSubject.next(false);
      },
    });
  }

  deleteCourse(id: string): Observable<void> {
    return this.api.deleteCourse(id).pipe(
      tap(() => this.toast.success('Course deleted'))
    );
  }
}
```

---

## Cubit → Service Mapping Summary

| Flutter Cubit | Angular Service |
|---|---|
| `AppCubit` | `AppStateService` |
| `HomeCubit` | `LandingService` |
| `ServicesCubit` | `ServiceCatalogService` |
| `ConsultationDetailCubit` | `ConsultationService.getById()` (stateless) |
| `ProfileCubit` | `ProfileService` (composes existing services) |
| `AdminCubit` | `AdminService` |
| `AuthStateHandlerBloc` | `AuthService` (BehaviorSubject<User \| null>) |

---

> **Prev:** [06 — Routing](06_routing.md) | **Next:** [08 — Migrating Screens](08_screens.md)
