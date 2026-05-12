# 09 — RxJS — Dart Streams on Steroids

> **Prev:** [08 — HttpClient](08_http_client.md) | **Next:** [10 — State Management](10_state_management.md)

RxJS (Reactive Extensions for JavaScript) is to Angular what Dart Streams are to Flutter — but with a far richer operator library. Mastering 10 operators covers 95% of real-world Angular code.

---

## Observable vs Dart Stream

```dart
// Dart Stream — push values over time
Stream<int> counter() async* {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
counter().listen((v) => print(v));  // subscribe
```

```typescript
// RxJS Observable — exact same concept
import { interval } from 'rxjs';
import { take, map } from 'rxjs/operators';

const counter$ = interval(1000).pipe(take(3));
counter$.subscribe(v => console.log(v));  // subscribe

// Naming convention: suffix Observable variables with $
const courses$: Observable<Course[]> = this.http.get<Course[]>('/api/courses');
```

Key difference: **Observables are cold by default** — they don't start until subscribed. Dart Streams can be either cold (StreamController) or hot (broadcast streams).

---

## Subject vs StreamController

```dart
// Dart broadcast stream
final controller = StreamController<bool>.broadcast();
controller.add(true);    // emit
controller.stream        // subscribe
controller.close();      // cleanup
```

```typescript
// RxJS Subject — same: multiple subscribers, no initial value
import { Subject } from 'rxjs';

const subject = new Subject<boolean>();
subject.next(true);            // emit
subject.asObservable()         // expose as read-only
subject.complete();            // cleanup

// BehaviorSubject — has a current/initial value (like ValueNotifier in Flutter)
import { BehaviorSubject } from 'rxjs';

const isLoading$ = new BehaviorSubject<boolean>(false);
isLoading$.next(true);              // emit new value
isLoading$.getValue();              // read current value synchronously
isLoading$.asObservable()           // read-only Observable

// ReplaySubject — replays last N values to new subscribers (rarely needed)
const replay$ = new ReplaySubject<string>(1);  // keep last 1 value
```

**Rule of thumb:** Use `BehaviorSubject` for state (it always has a value). Use `Subject` for events (login triggered, dialog closed, etc.).

---

## Essential Operators

### `map` — Transform values

```typescript
// Dart equivalent: stream.map((x) => x * 2)
courses$.pipe(
  map(courses => courses.filter(c => c.featured))
)

// Chain multiple transformations
http.get<User>('/api/auth/me').pipe(
  map(user => ({ ...user, fullName: `${user.firstName} ${user.lastName}` }))
)
```

### `filter` — Conditional pass-through

```typescript
// Dart equivalent: stream.where((x) => x > 0)
orders$.pipe(
  filter(orders => orders.length > 0)
)
```

### `tap` — Side effects without transforming

```typescript
// Dart equivalent: stream.forEach() but without breaking the chain
courses$.pipe(
  tap(courses => console.log('Loaded', courses.length, 'courses')),
  tap(courses => this.analytics.track('courses_loaded', courses.length))
)
```

### `switchMap` — Async chain, cancels previous

The most important operator. When a new value arrives, it cancels the previous inner observable. Essential for search autocomplete and navigation:

```typescript
// Dart equivalent: asyncExpand + cancellation
// When user types, cancel previous HTTP request and fire new one
searchQuery$.pipe(
  debounceTime(300),         // wait 300ms after user stops typing
  distinctUntilChanged(),    // don't search if query didn't change
  switchMap(query =>         // cancel previous, start new
    this.http.get<Course[]>(`/api/courses?q=${query}`).pipe(
      catchError(() => of([]))  // don't break the outer stream on error
    )
  )
)
```

Other flattening operators:
- `mergeMap` — run all inner Observables concurrently (don't cancel)
- `concatMap` — queue inner Observables, run one at a time
- `exhaustMap` — ignore new values while inner Observable is running (good for form submit)

### `catchError` — Error handling

```typescript
// Handle error and return fallback
courses$.pipe(
  catchError(err => of([]))              // return empty array
)

// Handle and rethrow
courses$.pipe(
  catchError(err => {
    this.logger.error(err);
    return throwError(() => err);        // rethrow
  })
)
```

### `takeUntil` — Unsubscribe on signal

The standard cleanup pattern — equivalent to canceling a StreamSubscription in Flutter's `dispose()`:

```typescript
private destroy$ = new Subject<void>();

ngOnInit() {
  this.service.data$
    .pipe(takeUntil(this.destroy$))    // auto-unsubscribe when destroy$ emits
    .subscribe(data => this.data = data);
}

ngOnDestroy() {
  this.destroy$.next();      // trigger unsubscription
  this.destroy$.complete();
}
```

### `combineLatest` — Merge multiple streams

```typescript
// Dart: Rx.combineLatest([stream1, stream2], ...)
// Re-emits whenever ANY source emits
import { combineLatest } from 'rxjs';

combineLatest([
  this.courseService.courses$,
  this.categoryService.categories$,
]).pipe(
  map(([courses, categories]) => ({
    courses,
    categories,
    featured: courses.filter(c => c.featured),
  }))
).subscribe(vm => this.viewModel = vm);
```

### `forkJoin` — Wait for all to complete

```typescript
// Dart: Future.wait([...])
// Waits for ALL observables to complete, emits last values
import { forkJoin } from 'rxjs';

forkJoin({
  courses: this.http.get<Course[]>('/api/courses'),
  staff: this.http.get<Staff[]>('/api/staff'),
  info: this.http.get<GeneralInfo>('/api/general-info'),
}).subscribe(({ courses, staff, info }) => {
  this.courses = courses;
  this.staff = staff;
  this.info = info;
});
```

### `debounceTime` and `distinctUntilChanged`

Essential for search inputs:

```typescript
this.searchControl.valueChanges.pipe(
  debounceTime(300),           // wait 300ms after last keystroke
  distinctUntilChanged(),      // skip if value hasn't changed
  switchMap(q => this.api.searchCourses(q))
).subscribe(results => this.results = results);
```

### `startWith` — Emit initial value

```typescript
courses$.pipe(
  startWith([])  // immediately emit [] while loading
)
```

---

## The `async` Pipe — Subscribe in Template

The `async` pipe is how you consume Observables in templates without manually subscribing. **Always prefer `async` pipe over manual subscribe** — it handles cleanup automatically:

```html
<!-- Flutter BlocBuilder equivalent -->
@if (courses$ | async; as courses) {
  @for (course of courses; track course.id) {
    <app-course-card [course]="course" />
  }
}

<!-- Combining multiple observables -->
@if (vm$ | async; as vm) {
  <app-courses-list [courses]="vm.courses" />
  <app-sidebar [categories]="vm.categories" />
}
```

```typescript
// Create a combined view model observable
vm$ = combineLatest({
  courses: this.courseService.courses$,
  loading: this.courseService.loading$,
  categories: this.appService.categories$,
});
```

---

## When to subscribe manually

Use manual subscribe (with `takeUntil`) for side effects that don't involve the template:

```typescript
ngOnInit() {
  // side effect: update URL when filter changes
  this.filterService.activeFilter$
    .pipe(takeUntil(this.destroy$))
    .subscribe(filter => {
      this.router.navigate([], { queryParams: { category: filter } });
    });
}
```

---

## Creating Observables

```typescript
import { of, from, interval, timer, fromEvent, EMPTY, NEVER } from 'rxjs';

of(1, 2, 3)                    // emit 1, 2, 3 then complete — like Stream.fromIterable
from([1, 2, 3])                // emit array items one by one
from(promise)                  // wrap a Promise — like Stream.fromFuture
interval(1000)                 // emit 0, 1, 2... every second
timer(3000)                    // emit once after 3 seconds
fromEvent(button, 'click')     // DOM events as Observable
EMPTY                          // completes immediately, emits nothing
NEVER                          // never completes, never emits
```

---

## RxJS Marble Diagrams

Understanding how operators transform streams visually:
```
source:  --1--2--3--4--|
map(x => x * 2):
output:  --2--4--6--8--|

switchMap (new value cancels previous):
source:    --A--------B------C--|
inner A:   ---a1--a2--
inner B:             ---b1--b2--
inner C:                      ---c1--
output:    ---a1--a2-----b1--b2----c1--|
```

See [rxmarbles.com](https://rxmarbles.com) for interactive visualizations.

---

## Further Reading

- [RxJS Official Docs](https://rxjs.dev) — operator reference, guides
- [RxMarbles](https://rxmarbles.com) — visual, interactive operator diagrams
- [Learn RxJS](https://www.learnrxjs.io) — operator examples with clear explanations
- [Angular University: RxJS In Practice](https://blog.angular-university.io/rxjs-error-handling/) — error handling patterns
- [RxJS Operator Decision Tree](https://rxjs.dev/operator-decision-tree) — "which operator should I use?"

---

> **Prev:** [08 — HttpClient](08_http_client.md) | **Next:** [10 — State Management](10_state_management.md)
