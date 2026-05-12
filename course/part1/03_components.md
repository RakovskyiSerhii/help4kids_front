# 03 — Components — Angular's Widgets

> **Prev:** [02 — Architecture](02_architecture.md) | **Next:** [04 — Templates & Binding](04_templates.md)

A **Component** is Angular's equivalent of a Flutter Widget. It has three parts: a TypeScript class (logic), an HTML template (UI), and optional SCSS styles. The class is like your Cubit merged with your Widget — it holds both state and rendering logic.

---

## Creating a Component

```bash
# Angular CLI generates all four files automatically
ng generate component features/courses/course-card
# or shorthand:
ng g c features/courses/course-card
```

This creates:
- `course-card.component.ts` — class + decorator
- `course-card.component.html` — template
- `course-card.component.scss` — styles (scoped to this component)
- `course-card.component.spec.ts` — unit test

---

## Component Anatomy

```typescript
// course-card.component.ts
import { Component, Input, Output, EventEmitter, ChangeDetectionStrategy } from '@angular/core';
import { CurrencyPipe, NgClass } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { Course } from '../../data/models/course.model';

@Component({
  standalone: true,
  selector: 'app-course-card',               // tag name used in other templates
  templateUrl: './course-card.component.html',
  styleUrls: ['./course-card.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [MatCardModule, MatButtonModule, CurrencyPipe, NgClass],
})
export class CourseCardComponent {
  @Input() course!: Course;           // ! = definitely provided by parent
  @Input() purchased = false;
  @Output() buy = new EventEmitter<Course>();

  onBuyClick(): void {
    this.buy.emit(this.course);
  }
}
```

```html
<!-- course-card.component.html -->
<mat-card [ngClass]="{ 'purchased': purchased }">
  <mat-card-header>
    <mat-card-title>{{ course.title }}</mat-card-title>
    <mat-card-subtitle>{{ course.price | currency:'UAH':'symbol':'1.0-0' }}</mat-card-subtitle>
  </mat-card-header>

  <img mat-card-image [src]="course.image" [alt]="course.title" *ngIf="course.image" />

  <mat-card-content>
    <p>{{ course.shortDescription }}</p>
  </mat-card-content>

  <mat-card-actions>
    <button mat-raised-button color="primary"
            [disabled]="purchased"
            (click)="onBuyClick()">
      {{ purchased ? 'Purchased' : 'Buy' }}
    </button>
  </mat-card-actions>
</mat-card>
```

---

## @Input() — Passing Data Down

Like passing named parameters to a Flutter Widget constructor:

```dart
// Flutter
class CourseCard extends StatelessWidget {
  final Course course;
  final bool purchased;
  const CourseCard({required this.course, this.purchased = false});
}
```

```typescript
// Angular
export class CourseCardComponent {
  @Input({ required: true }) course!: Course;  // required since Angular 16
  @Input() purchased = false;                   // with default value
  @Input() set price(value: number) {           // setter input — runs when value changes
    this._displayPrice = `${value} UAH`;
  }
  private _displayPrice = '';
}
```

```html
<!-- Parent template -->
<app-course-card
  [course]="selectedCourse"
  [purchased]="isPurchased(selectedCourse.id)"
/>
```

---

## @Output() — Events Up

Like passing a callback or `VoidCallback` in Flutter:

```dart
// Flutter
class CourseCard extends StatelessWidget {
  final Course course;
  final void Function(Course) onBuy;
}
```

```typescript
// Angular
export class CourseCardComponent {
  @Input() course!: Course;
  @Output() buy = new EventEmitter<Course>();    // typed EventEmitter
  @Output() viewDetail = new EventEmitter<void>();

  onBuyClick() { this.buy.emit(this.course); }
  onViewClick() { this.viewDetail.emit(); }
}
```

```html
<!-- Parent template -->
<app-course-card
  [course]="course"
  (buy)="handleBuy($event)"
  (viewDetail)="router.navigate(['/courses', course.id])"
/>
```

---

## Lifecycle Hooks

Every component has lifecycle hooks Angular calls automatically. They map directly to Flutter's StatefulWidget lifecycle:

| Angular Hook | Flutter Equivalent | When it runs |
|---|---|---|
| `ngOnInit()` | `initState()` | After first `@Input()` values are set |
| `ngOnChanges(changes)` | `didUpdateWidget()` | When any `@Input()` value changes |
| `ngAfterViewInit()` | `addPostFrameCallback` | After template is fully rendered |
| `ngOnDestroy()` | `dispose()` | Before component is removed |

```typescript
import { Component, OnInit, OnDestroy, OnChanges, SimpleChanges, Input } from '@angular/core';
import { Subject, takeUntil } from 'rxjs';

export class ConsultationDetailComponent implements OnInit, OnChanges, OnDestroy {
  @Input() consultationId!: string;

  private destroy$ = new Subject<void>();  // cleanup signal

  ngOnInit(): void {
    // Runs once after component created — like initState()
    this.loadData();

    // Subscribe with takeUntil for automatic cleanup
    this.someService.updates$
      .pipe(takeUntil(this.destroy$))
      .subscribe(data => this.handleUpdate(data));
  }

  ngOnChanges(changes: SimpleChanges): void {
    // Runs when @Input values change — like didUpdateWidget()
    if (changes['consultationId'] && !changes['consultationId'].firstChange) {
      this.loadData();  // reload when ID changes
    }
  }

  ngOnDestroy(): void {
    // Runs before component removed — like dispose()
    this.destroy$.next();
    this.destroy$.complete();
  }

  private loadData(): void { ... }
}
```

---

## View Encapsulation

Angular scopes CSS to the component by default (Emulated encapsulation). Styles in `course-card.component.scss` only affect that component's template — equivalent to Flutter's widget-specific styling.

```typescript
import { ViewEncapsulation } from '@angular/core';

@Component({
  encapsulation: ViewEncapsulation.Emulated,  // default: scoped styles
  // ViewEncapsulation.None     — global styles (use for themes)
  // ViewEncapsulation.ShadowDom — native Web Components shadow DOM
})
```

---

## Smart vs Dumb Components

Just like Flutter's separation of Cubit (smart) and Widget (dumb):

**Dumb (Presentational) Component** — only `@Input`/`@Output`, no services injected:
```typescript
// course-card.component.ts — dumb
export class CourseCardComponent {
  @Input() course!: Course;
  @Output() buy = new EventEmitter<Course>();
}
```

**Smart (Container) Component** — injects services, manages data:
```typescript
// courses.component.ts — smart
export class CoursesComponent implements OnInit {
  courses$ = this.courseService.courses$;

  constructor(
    private courseService: CourseService,
    private router: Router,
  ) {}

  ngOnInit() { this.courseService.loadCourses(); }
}
```

This pattern makes components reusable and easy to test.

---

## Content Projection (like Flutter's `child` parameter)

```typescript
// card-wrapper.component.html
<div class="card">
  <ng-content select="[card-header]" />   <!-- named slot -->
  <ng-content />                           <!-- default slot (like Flutter's child) -->
</div>
```

```html
<!-- Usage -->
<app-card-wrapper>
  <h2 card-header>Card Title</h2>
  <p>Card body content goes here.</p>
</app-card-wrapper>
```

---

## Further Reading

- [Angular Components Guide](https://angular.dev/guide/components) — official, covers all of the above
- [Component Inputs](https://angular.dev/guide/components/inputs) — required inputs, transforms, aliases
- [Component Outputs](https://angular.dev/guide/components/outputs) — EventEmitter, model inputs
- [Component Lifecycle](https://angular.dev/guide/components/lifecycle) — all hooks explained in detail
- [Content Projection](https://angular.dev/guide/components/content-projection) — ng-content and named slots

---

> **Prev:** [02 — Architecture](02_architecture.md) | **Next:** [04 — Templates & Binding](04_templates.md)
