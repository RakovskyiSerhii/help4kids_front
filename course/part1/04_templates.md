# 04 — Templates & Data Binding

> **Prev:** [03 — Components](03_components.md) | **Next:** [05 — Directives](05_directives.md)

Templates are HTML files with Angular-specific syntax. They are the equivalent of Flutter's `build()` method — they describe what the UI looks like based on current data. Angular templates are type-checked at compile time, just like Dart.

---

## Interpolation `{{ }}`

Embed TypeScript expressions into HTML text:

```html
<h1>{{ user.firstName }} {{ user.lastName }}</h1>
<p>Total: {{ orders.length }} orders</p>
<span>{{ consultation.price * 1.2 | number:'1.0-0' }} UAH (with VAT)</span>
```

Expressions must be **pure and side-effect free** — no assignments, no `new`, no complex logic. Put logic in the component class.

---

## Property Binding `[property]`

Binds a TypeScript expression to an HTML element property (not attribute):

```html
<!-- Binding to standard HTML properties -->
<img [src]="course.image" [alt]="course.title" />
<button [disabled]="isLoading || form.invalid">Submit</button>
<input [value]="searchQuery" />

<!-- Binding to component @Input() -->
<app-course-card [course]="selectedCourse" [purchased]="isPurchased" />

<!-- Binding to CSS classes and styles -->
<div [class.active]="isSelected">Item</div>
<div [style.color]="errorColor">Error message</div>
```

**Key rule:** `[property]` binds to a DOM **property** (JavaScript), not an HTML **attribute**. For attributes without a matching property, use `[attr.name]`:

```html
<td [attr.colspan]="colSpan">Cell</td>
<button [attr.aria-label]="buttonLabel">Click</button>
```

---

## Event Binding `(event)`

Listens to DOM events and calls component methods:

```html
<button (click)="onSubmit()">Login</button>
<input (input)="onSearch($event)" (keyup.enter)="onSearchEnter()" />
<form (ngSubmit)="onFormSubmit()">...</form>
<div (mouseover)="highlight()" (mouseleave)="unhighlight()">Hover me</div>
```

`$event` is the native DOM event:

```typescript
onSearch(event: Event): void {
  const value = (event.target as HTMLInputElement).value;
  this.searchQuery = value;
}
```

---

## Two-Way Binding `[(ngModel)]`

Syncs a value between the template and the component — like Flutter's `TextEditingController` but simpler:

```html
<!-- Requires FormsModule in imports -->
<input [(ngModel)]="email" type="email" />
<input [(ngModel)]="searchQuery" placeholder="Search..." />
<select [(ngModel)]="selectedCategoryId">
  <option *ngFor="let cat of categories" [value]="cat.id">{{ cat.name }}</option>
</select>
```

`[(ngModel)]` is shorthand for:
```html
<input [value]="email" (input)="email = $event.target.value" />
```

For forms use Reactive Forms (Module 11) instead — `[(ngModel)]` is mainly for simple bindings.

---

## Pipes — Formatting Values

Pipes transform display values in templates. Think of them as Dart extension methods or `intl` formatters:

```html
{{ course.price | currency:'UAH':'symbol':'1.0-0' }}
{{ article.createdAt | date:'dd MMM yyyy' }}
{{ user.firstName | uppercase }}
{{ longText | slice:0:100 }}{{ longText.length > 100 ? '...' : '' }}
{{ items | json }}            <!-- debug: print object as JSON -->
{{ observable$ | async }}    <!-- subscribe/unsubscribe automatically -->
```

**Built-in pipes:**

| Pipe | Example | Output |
|------|---------|--------|
| `currency` | `1500 \| currency:'UAH'` | `UAH 1,500.00` |
| `date` | `date \| date:'dd/MM/yyyy'` | `30/04/2026` |
| `uppercase` | `'hello' \| uppercase` | `HELLO` |
| `lowercase` | `'HELLO' \| lowercase` | `hello` |
| `number` | `3.14159 \| number:'1.2-2'` | `3.14` |
| `percent` | `0.25 \| percent` | `25%` |
| `slice` | `[1,2,3,4] \| slice:1:3` | `[2,3]` |
| `async` | `obs$ \| async` | unwrapped value |
| `keyvalue` | `obj \| keyvalue` | `[{key, value}]` |

### Custom Pipe

```typescript
// safe-html.pipe.ts
@Pipe({ name: 'safeHtml', standalone: true })
export class SafeHtmlPipe implements PipeTransform {
  constructor(private sanitizer: DomSanitizer) {}

  transform(value: string): SafeHtml {
    return this.sanitizer.bypassSecurityTrustHtml(DOMPurify.sanitize(value));
  }
}
```

```html
<div [innerHTML]="article.content | safeHtml"></div>
```

---

## Template Reference Variables `#var`

Give a name to a template element or directive instance:

```html
<!-- Reference DOM element directly -->
<input #emailInput type="email" />
<button (click)="submit(emailInput.value)">Send</button>

<!-- Reference a directive -->
<form #loginForm="ngForm" (ngSubmit)="onSubmit(loginForm)">
  <button [disabled]="loginForm.invalid">Login</button>
</form>

<!-- Reference a component -->
<app-date-picker #picker />
<button (click)="picker.open()">Pick date</button>
```

---

## Safe Navigation `?.`

Prevents errors when a value is null or undefined — same syntax as Dart:

```html
<span>{{ user?.profile?.displayName }}</span>
<img [src]="consultation?.image ?? '/assets/placeholder.png'" />
```

---

## NgIf with Async — The Core Pattern

The most important pattern in Angular templates. Replaces Flutter's `BlocBuilder`:

```html
<!-- Flutter equivalent:
     BlocBuilder<HomeCubit, HomeState>(
       builder: (context, state) {
         if (state.loading) return CircularProgressIndicator();
         return HomeBody(data: state.landing);
       }
     )
-->

<!-- Option 1: ngIf with async pipe -->
<ng-container *ngIf="landing$ | async as landing; else loading">
  <app-hero [data]="landing" />
</ng-container>

<ng-template #loading>
  <mat-spinner class="center-spinner" />
</ng-template>

<!-- Option 2: Angular 17+ @if syntax (preferred) -->
@if (landing$ | async; as landing) {
  <app-hero [data]="landing" />
} @else {
  <mat-spinner class="center-spinner" />
}
```

The `async` pipe:
- Subscribes to the Observable automatically when the component is created
- Unsubscribes automatically when the component is destroyed (no memory leaks)
- Triggers change detection when a new value arrives

---

## `<ng-container>` — Invisible Wrapper

Like Flutter's `Fragment` in React or just wrapping in a `Column` just for `if`/`for` — a grouping element that renders no actual DOM node:

```html
<!-- Without ng-container you'd need a real <div> just for *ngIf -->
<ng-container *ngIf="isAdmin">
  <a routerLink="/admin">Admin</a>
  <a routerLink="/admin/users">Users</a>
</ng-container>
```

---

## Further Reading

- [Angular Templates Overview](https://angular.dev/guide/templates) — official
- [Property & Event Binding](https://angular.dev/guide/templates/binding) — deep dive
- [Built-in Pipes](https://angular.dev/guide/pipes/built-in) — full reference
- [Custom Pipes](https://angular.dev/guide/pipes/creating) — how to build your own
- [Template Variables](https://angular.dev/guide/templates/reference-variables)

---

> **Prev:** [03 — Components](03_components.md) | **Next:** [05 — Directives](05_directives.md)
