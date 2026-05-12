# 05 — Directives

> **Prev:** [04 — Templates & Binding](04_templates.md) | **Next:** [06 — Services & DI](06_services_di.md)

Directives extend HTML with custom behavior. Angular has three kinds:
- **Structural** — add/remove elements (like `*ngIf`, `*ngFor`)
- **Attribute** — modify element appearance/behavior (`[ngClass]`, `[ngStyle]`)
- **Component** — a directive with a template (every component is technically a directive)

---

## *ngIf — Conditional Rendering

Flutter equivalent: `if (condition) Widget() else OtherWidget()`

```html
<!-- Basic -->
<div *ngIf="isLoading">Loading...</div>

<!-- With else -->
<div *ngIf="courses.length > 0; else empty">
  <!-- course list -->
</div>
<ng-template #empty>
  <p class="empty-state">No courses available.</p>
</ng-template>

<!-- Capturing the value (important for async) -->
<div *ngIf="user$ | async as user">
  <h2>Welcome, {{ user.firstName }}</h2>
</div>
```

---

## *ngFor — List Rendering

Flutter equivalent: `ListView.builder` or `Column(children: items.map(...).toList())`

```html
<app-course-card
  *ngFor="let course of courses; trackBy: trackById; let i = index; let last = last"
  [course]="course"
  [class.last-item]="last"
/>
```

```typescript
// Always provide trackBy for performance — like Flutter's key parameter
trackById(index: number, item: { id: string }): string {
  return item.id;
}
```

Available local variables inside `*ngFor`:
| Variable | Type | Meaning |
|---|---|---|
| `index` | `number` | 0-based position |
| `first` | `boolean` | is first item |
| `last` | `boolean` | is last item |
| `even` | `boolean` | index is even |
| `odd` | `boolean` | index is odd |

---

## Angular 17+ Control Flow (new syntax — preferred)

Angular 17 introduced a cleaner built-in control flow syntax that replaces `*ngIf` and `*ngFor`. Use this in new code:

```html
<!-- @if — replaces *ngIf -->
@if (isLoading) {
  <mat-spinner />
} @else if (error) {
  <app-error-state [message]="error" />
} @else {
  <div class="content">Ready</div>
}

<!-- @for — replaces *ngFor -->
@for (course of courses; track course.id) {
  <app-course-card [course]="course" />
} @empty {
  <p>No courses found.</p>
}

<!-- @switch — replaces ngSwitch -->
@switch (order.status) {
  @case ('pending') { <span class="badge pending">Processing</span> }
  @case ('paid') { <span class="badge paid">Paid</span> }
  @case ('failed') { <span class="badge failed">Failed</span> }
  @default { <span>Unknown</span> }
}
```

The `@empty` block in `@for` is especially nice — no need for a separate `*ngIf` on an empty state.

---

## Combining async with new control flow

```html
<!-- The cleanest pattern for loading observables -->
@if (landing$ | async; as landing) {
  <app-hero [data]="landing.generalInfo" />

  @for (course of landing.featuredCourses; track course.id) {
    <app-course-card [course]="course" />
  } @empty {
    <p>No featured courses yet.</p>
  }
} @else {
  <mat-spinner />
}
```

---

## Attribute Directives

### ngClass — Conditional CSS Classes

```html
<!-- Object syntax — keys are class names, values are conditions -->
<div [ngClass]="{
  'featured': course.featured,
  'purchased': isPurchased,
  'out-of-stock': course.price === 0
}">
  {{ course.title }}
</div>

<!-- Array syntax -->
<div [ngClass]="['card', isActive ? 'card--active' : 'card--inactive']">

<!-- String syntax -->
<div [ngClass]="statusClass">  <!-- statusClass computed in component -->
```

```typescript
get statusClass(): string {
  return `order-status order-status--${this.order.status}`;
}
```

### ngStyle — Conditional Inline Styles

```html
<div [ngStyle]="{
  'color': textColor,
  'background-color': bgColor,
  'font-size.px': fontSize   // .px appends the unit automatically
}">
  Styled content
</div>
```

---

## Custom Attribute Directive

Create reusable behavior that you attach to elements — like Flutter's gesture detectors or decoration wrappers:

```typescript
// highlight.directive.ts
import { Directive, ElementRef, HostListener, Input } from '@angular/core';

@Directive({
  standalone: true,
  selector: '[appHighlight]',   // used as an attribute: <div appHighlight>
})
export class HighlightDirective {
  @Input() appHighlight = 'yellow';  // color input

  constructor(private el: ElementRef) {}

  @HostListener('mouseenter')
  onMouseEnter() {
    this.el.nativeElement.style.backgroundColor = this.appHighlight;
  }

  @HostListener('mouseleave')
  onMouseLeave() {
    this.el.nativeElement.style.backgroundColor = '';
  }
}
```

```html
<!-- Usage -->
<app-course-card appHighlight="lightyellow" [course]="course" />
<div appHighlight>Default yellow highlight</div>
```

---

## Custom Structural Directive

For advanced cases where you need to add/remove DOM elements:

```typescript
// loading.directive.ts — shows spinner while true
@Directive({
  standalone: true,
  selector: '[appLoading]',
})
export class LoadingDirective implements OnInit {
  @Input('appLoading') set isLoading(value: boolean) {
    if (value) {
      this.vcr.clear();
      this.vcr.createEmbeddedView(this.spinnerTemplate);
    } else {
      this.vcr.clear();
      this.vcr.createEmbeddedView(this.contentTemplate);
    }
  }

  constructor(
    private contentTemplate: TemplateRef<unknown>,
    private vcr: ViewContainerRef,
    @Inject(SPINNER_TEMPLATE) private spinnerTemplate: TemplateRef<unknown>,
  ) {}
}
```

In practice you will rarely need custom structural directives — `@if`/`@for` cover most cases.

---

## Further Reading

- [Built-in Control Flow](https://angular.dev/guide/templates/control-flow) — @if, @for, @switch official docs
- [NgIf, NgFor (old syntax)](https://angular.dev/api/common/NgIf) — still valid, many projects use it
- [NgClass](https://angular.dev/api/common/NgClass) — full API
- [Building Custom Directives](https://angular.dev/guide/directives/attribute-directives) — step-by-step guide

---

> **Prev:** [04 — Templates & Binding](04_templates.md) | **Next:** [06 — Services & DI](06_services_di.md)
