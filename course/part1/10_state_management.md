# 10 — State Management

> **Prev:** [09 — RxJS](09_rxjs.md) | **Next:** [11 — Forms](11_forms.md)

Angular has no single built-in state management solution — you choose based on app complexity. Three options map cleanly to what you already know from Flutter.

---

## Option 1: Service + BehaviorSubject (maps to Cubit)

The simplest approach. A service holds a `BehaviorSubject` for each piece of state. Components subscribe via the `async` pipe. This is the recommended approach for the Help4Kids project.

### The Complete Pattern

```typescript
// courses.service.ts — this IS your CoursesCubit
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, map } from 'rxjs';

export interface CoursesState {
  courses: Course[];
  loading: boolean;
  error: string | null;
}

@Injectable({ providedIn: 'root' })
export class CoursesService {
  // Private mutable state (like Cubit's private fields)
  private state$ = new BehaviorSubject<CoursesState>({
    courses: [],
    loading: false,
    error: null,
  });

  // Public selectors — like Cubit state properties
  courses$ = this.state$.pipe(map(s => s.courses));
  loading$ = this.state$.pipe(map(s => s.loading));
  error$ = this.state$.pipe(map(s => s.error));
  featuredCourses$ = this.courses$.pipe(
    map(courses => courses.filter(c => c.featured))
  );

  constructor(private http: HttpClient) {}

  // Actions — like Cubit methods that call emit()
  loadCourses(): void {
    this.patch({ loading: true, error: null });

    this.http.get<Course[]>('/api/courses').subscribe({
      next: courses => this.patch({ courses, loading: false }),
      error: err => this.patch({ error: err.message, loading: false }),
    });
  }

  loadMyCourses(): void {
    this.patch({ loading: true });
    this.http.get<Course[]>('/api/courses/me').subscribe({
      next: courses => this.patch({ courses, loading: false }),
      error: err => this.patch({ error: err.message, loading: false }),
    });
  }

  // Helper — partial state update (like Cubit's copyWith)
  private patch(partial: Partial<CoursesState>): void {
    this.state$.next({ ...this.state$.getValue(), ...partial });
  }
}
```

```typescript
// courses.component.ts — thin, just reads state and triggers actions
@Component({ ... })
export class CoursesComponent implements OnInit {
  courses$ = this.coursesService.courses$;
  loading$ = this.coursesService.loading$;
  error$ = this.coursesService.error$;

  constructor(private coursesService: CoursesService) {}

  ngOnInit(): void {
    this.coursesService.loadCourses();
  }
}
```

```html
<!-- courses.component.html -->
@if (loading$ | async) {
  <mat-spinner />
} @else if (error$ | async; as error) {
  <p class="error">{{ error }}</p>
} @else {
  @for (course of courses$ | async; track course.id) {
    <app-course-card [course]="course" />
  } @empty {
    <p>No courses found.</p>
  }
}
```

### Global App State (maps to AppCubit)

```typescript
// app-state.service.ts — singleton, auto-loads on first injection
@Injectable({ providedIn: 'root' })
export class AppStateService {
  private generalInfo$ = new BehaviorSubject<GeneralInfo | null>(null);

  info$ = this.generalInfo$.asObservable();
  categories$ = this.info$.pipe(
    map(info => info?.categories ?? []),
  );
  socialContacts$ = this.info$.pipe(
    map(info => info?.socialContacts ?? []),
  );

  constructor(private http: HttpClient) {
    this.loadGeneralInfo();   // like AppCubit's constructor call to load()
  }

  private loadGeneralInfo(): void {
    this.http.get<GeneralInfo>('/api/general-info')
      .subscribe(info => this.generalInfo$.next(info));
  }
}
```

---

## Option 2: Angular Signals (Angular 17+ — like ValueNotifier)

Signals are Angular's reactive primitive — simpler than RxJS for local component state. They are synchronous and don't need the `async` pipe.

```typescript
import { signal, computed, effect } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class CoursesService {
  // Signals — like ValueNotifier<T>
  courses = signal<Course[]>([]);
  loading = signal(false);
  error = signal<string | null>(null);

  // Computed — derived signal, auto-recalculates when deps change
  featuredCourses = computed(() => this.courses().filter(c => c.featured));
  courseCount = computed(() => this.courses().length);

  constructor(private http: HttpClient) {}

  loadCourses(): void {
    this.loading.set(true);
    this.http.get<Course[]>('/api/courses').subscribe({
      next: courses => {
        this.courses.set(courses);
        this.loading.set(false);
      },
      error: err => {
        this.error.set(err.message);
        this.loading.set(false);
      }
    });
  }

  addCourse(course: Course): void {
    this.courses.update(existing => [...existing, course]);  // like copyWith
  }
}
```

```html
<!-- No async pipe needed — signals are synchronous -->
@if (coursesService.loading()) {
  <mat-spinner />
} @else {
  @for (course of coursesService.courses(); track course.id) {
    <app-course-card [course]="course" />
  }
}
```

```typescript
// Read signal value with ()
const count = this.coursesService.courseCount();

// React to signal changes with effect()
effect(() => {
  console.log('Courses changed:', this.coursesService.courses().length);
});
```

**When to use Signals vs BehaviorSubject:**
- Signals: simpler, great for component-local state or new codebases
- BehaviorSubject: better interop with RxJS operators, needed when you want to chain `pipe()` operations

---

## Option 3: NgRx (maps to full BLoC pattern)

NgRx is the Redux pattern for Angular: Actions → Reducers → Store → Selectors, with Effects for side effects. It maps exactly to BLoC's Events → States.

Use NgRx when:
- Multiple components need to sync complex shared state
- You need a dev-tools timeline of all state changes
- Large team where strict state structure prevents bugs

For Help4Kids, NgRx is **overkill** — use Option 1.

```typescript
// For reference — NgRx structure

// 1. Actions (= BLoC events)
export const loadCourses = createAction('[Courses] Load');
export const loadCoursesSuccess = createAction(
  '[Courses] Load Success',
  props<{ courses: Course[] }>()
);
export const loadCoursesFail = createAction(
  '[Courses] Load Fail',
  props<{ error: string }>()
);

// 2. Reducer (= BLoC state + handlers)
const initialState: CoursesState = { courses: [], loading: false, error: null };

export const coursesReducer = createReducer(
  initialState,
  on(loadCourses, state => ({ ...state, loading: true })),
  on(loadCoursesSuccess, (state, { courses }) => ({ ...state, courses, loading: false })),
  on(loadCoursesFail, (state, { error }) => ({ ...state, error, loading: false })),
);

// 3. Selectors
export const selectCourses = (state: AppState) => state.courses.courses;
export const selectLoading = (state: AppState) => state.courses.loading;

// 4. Effects (= BLoC event handlers with side effects)
loadCourses$ = createEffect(() =>
  this.actions$.pipe(
    ofType(loadCourses),
    switchMap(() =>
      this.http.get<Course[]>('/api/courses').pipe(
        map(courses => loadCoursesSuccess({ courses })),
        catchError(err => of(loadCoursesFail({ error: err.message })))
      )
    )
  )
);
```

---

## Choosing a Strategy

| Scenario | Recommended |
|---|---|
| Simple page-level state | Service + BehaviorSubject |
| Component-local state (form, toggle, counter) | Signals |
| Shared state across many components | Service + BehaviorSubject |
| Complex app with many interacting features | NgRx |
| Help4Kids project | **Service + BehaviorSubject** |

---

## Anti-Patterns to Avoid

```typescript
// ❌ Don't subscribe in constructor — use ngOnInit
constructor() {
  this.service.data$.subscribe(...);   // leaks, no cleanup
}

// ✅ Subscribe in ngOnInit with takeUntil
ngOnInit() {
  this.service.data$.pipe(takeUntil(this.destroy$)).subscribe(...);
}

// ❌ Don't store Observable result in a variable via subscribe
ngOnInit() {
  this.service.courses$.subscribe(courses => this.courses = courses);
  // then use this.courses in template — this breaks OnPush detection
}

// ✅ Keep Observable, use async pipe
courses$ = this.service.courses$;
// template: @for (c of courses$ | async; ...)

// ❌ Don't expose BehaviorSubject directly
public state$ = new BehaviorSubject<State>(...);  // anyone can call state$.next()

// ✅ Expose as read-only Observable
private stateSubject$ = new BehaviorSubject<State>(...);
public state$ = this.stateSubject$.asObservable();  // read-only
```

---

## Further Reading

- [Angular Signals Guide](https://angular.dev/guide/signals) — official, comprehensive
- [NgRx Documentation](https://ngrx.io/docs) — if you want the BLoC-style approach
- [Angular University: BehaviorSubject State Pattern](https://blog.angular-university.io/angular-service-layer/) — service state management
- [RxJS BehaviorSubject](https://rxjs.dev/api/index/class/BehaviorSubject) — API reference
- [Angular Signals vs RxJS](https://blog.angular-university.io/angular-signals/) — when to use which

---

> **Prev:** [09 — RxJS](09_rxjs.md) | **Next:** [11 — Forms](11_forms.md)
