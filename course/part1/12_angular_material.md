# 12 — Angular Material

> **Prev:** [11 — Forms](11_forms.md) | **Next:** [Part 2 — Project Setup →](../part2/01_project_setup.md)

Angular Material is the official Material Design component library — the equivalent of Flutter's built-in Material widgets. Same design system, different API.

---

## Setup

```bash
ng add @angular/material
# Prompts:
# Choose a prebuilt theme name or "custom": Custom
# Set up global Angular Material typography styles: Yes
# Include the Angular animations module: Yes
```

This adds to `styles.scss`:
```scss
@use '@angular/material' as mat;
```

And to `app.config.ts`:
```typescript
provideAnimations()
```

---

## Custom Theme

Create a clinic-appropriate theme in `styles.scss`:

```scss
// styles.scss
@use '@angular/material' as mat;

// Define palette
$help4kids-primary: mat.define-palette(mat.$blue-palette, 700, 400, 900);
$help4kids-accent: mat.define-palette(mat.$orange-palette, A200, A100, A400);
$help4kids-warn: mat.define-palette(mat.$red-palette);

// Build theme
$help4kids-theme: mat.define-light-theme((
  color: (
    primary: $help4kids-primary,
    accent: $help4kids-accent,
    warn: $help4kids-warn,
  ),
  typography: mat.define-typography-config(
    $font-family: 'Poppins, sans-serif',
    $headline-1: mat.define-typography-level(48px, 56px, 700),
    $body-1: mat.define-typography-level(16px, 24px, 400),
  ),
  density: 0,
));

@include mat.all-component-themes($help4kids-theme);

// Dark mode support
@media (prefers-color-scheme: dark) {
  $dark-theme: mat.define-dark-theme((
    color: (primary: $help4kids-primary, accent: $help4kids-accent),
  ));
  @include mat.all-component-colors($dark-theme);
}
```

---

## Flutter Widget → Angular Material Component

| Flutter Widget | Angular Material | Import |
|---|---|---|
| `ElevatedButton` | `<button mat-raised-button>` | `MatButtonModule` |
| `TextButton` | `<button mat-button>` | `MatButtonModule` |
| `OutlinedButton` | `<button mat-stroked-button>` | `MatButtonModule` |
| `IconButton` | `<button mat-icon-button>` | `MatButtonModule` |
| `FloatingActionButton` | `<button mat-fab>` | `MatButtonModule` |
| `TextField` | `<mat-form-field><input matInput></mat-form-field>` | `MatFormFieldModule`, `MatInputModule` |
| `Card` | `<mat-card>` | `MatCardModule` |
| `CircularProgressIndicator` | `<mat-spinner>` | `MatProgressSpinnerModule` |
| `LinearProgressIndicator` | `<mat-progress-bar>` | `MatProgressBarModule` |
| `Chip` | `<mat-chip>` | `MatChipsModule` |
| `Dialog / showDialog` | `MatDialog.open(Component)` | `MatDialogModule` |
| `SnackBar` | `MatSnackBar.open()` | `MatSnackBarModule` |
| `Drawer` | `<mat-sidenav>` | `MatSidenavModule` |
| `AppBar / Toolbar` | `<mat-toolbar>` | `MatToolbarModule` |
| `Icon` | `<mat-icon>` | `MatIconModule` |
| `Divider` | `<mat-divider>` | `MatDividerModule` |
| `ExpansionTile` | `<mat-expansion-panel>` | `MatExpansionModule` |
| `TabBar + TabBarView` | `<mat-tab-group>` | `MatTabsModule` |
| `DropdownButton` | `<mat-select>` | `MatSelectModule` |
| `Checkbox` | `<mat-checkbox>` | `MatCheckboxModule` |
| `Switch / Toggle` | `<mat-slide-toggle>` | `MatSlideToggleModule` |
| `Slider` | `<mat-slider>` | `MatSliderModule` |
| `DatePicker` | `<mat-datepicker>` | `MatDatepickerModule` |
| `Table` | `<mat-table>` / `<table mat-table>` | `MatTableModule` |
| `ListTile` | `<mat-list-item>` | `MatListModule` |
| `PopupMenuButton` | `<button [matMenuTriggerFor]="menu">` + `<mat-menu>` | `MatMenuModule` |
| `Tooltip` | `[matTooltip]="'text'"` | `MatTooltipModule` |
| `Badge` | `[matBadge]="count"` | `MatBadgeModule` |
| `CircleAvatar` | `<img>` or `<span>` with CSS | — |

---

## Common Usage Examples

### Buttons

```html
<button mat-raised-button color="primary" (click)="submit()">Submit</button>
<button mat-stroked-button color="accent" [disabled]="isLoading">Cancel</button>
<button mat-icon-button (click)="delete()">
  <mat-icon>delete</mat-icon>
</button>
<button mat-fab color="primary" routerLink="/courses/create">
  <mat-icon>add</mat-icon>
</button>
```

### Form Field

```html
<mat-form-field appearance="outline">
  <mat-label>Email</mat-label>
  <mat-icon matPrefix>email</mat-icon>
  <input matInput type="email" [formControl]="emailControl" />
  <mat-hint>We'll never share your email</mat-hint>
  <mat-error *ngIf="emailControl.hasError('required')">Required</mat-error>
  <mat-error *ngIf="emailControl.hasError('email')">Invalid email</mat-error>
</mat-form-field>
```

### Card

```html
<mat-card class="course-card">
  <img mat-card-image [src]="course.image" [alt]="course.title" />
  <mat-card-header>
    <mat-card-title>{{ course.title }}</mat-card-title>
    <mat-card-subtitle>{{ course.price | currency:'UAH':'symbol':'1.0-0' }}</mat-card-subtitle>
  </mat-card-header>
  <mat-card-content>
    <p>{{ course.shortDescription }}</p>
  </mat-card-content>
  <mat-card-actions align="end">
    <button mat-button (click)="onViewDetail()">Details</button>
    <button mat-raised-button color="primary" (click)="onBuy()">Buy</button>
  </mat-card-actions>
</mat-card>
```

### Dialog

```typescript
// dialog usage in component
import { MatDialog } from '@angular/material/dialog';

export class CoursesComponent {
  constructor(private dialog: MatDialog) {}

  openBuyDialog(course: Course): void {
    const ref = this.dialog.open(BuyDialogComponent, {
      data: { course },
      width: '480px',
    });

    ref.afterClosed().subscribe(result => {
      if (result === 'confirmed') {
        this.purchaseCourse(course);
      }
    });
  }
}
```

```typescript
// dialog component
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  template: `
    <h2 mat-dialog-title>Buy {{ data.course.title }}?</h2>
    <mat-dialog-content>
      <p>Price: {{ data.course.price | currency:'UAH' }}</p>
    </mat-dialog-content>
    <mat-dialog-actions align="end">
      <button mat-button mat-dialog-close>Cancel</button>
      <button mat-raised-button color="primary" [mat-dialog-close]="'confirmed'">Confirm</button>
    </mat-dialog-actions>
  `,
  standalone: true,
  imports: [MatDialogModule, MatButtonModule, CurrencyPipe],
})
export class BuyDialogComponent {
  constructor(
    @Inject(MAT_DIALOG_DATA) public data: { course: Course },
    public dialogRef: MatDialogRef<BuyDialogComponent>,
  ) {}
}
```

### Snackbar (Toasts)

```typescript
import { MatSnackBar } from '@angular/material/snack-bar';

export class CourseService {
  constructor(private snackBar: MatSnackBar) {}

  showSuccess(message: string): void {
    this.snackBar.open(message, 'Close', {
      duration: 3000,
      panelClass: ['snackbar-success'],
    });
  }

  showError(message: string): void {
    this.snackBar.open(message, 'Retry', {
      duration: 5000,
      panelClass: ['snackbar-error'],
    });
  }
}
```

### Navigation Drawer (Mobile Menu)

```html
<mat-sidenav-container>
  <mat-sidenav #sidenav mode="over" position="end">
    <mat-nav-list>
      <a mat-list-item routerLink="/" (click)="sidenav.close()">Home</a>
      <a mat-list-item routerLink="/courses" (click)="sidenav.close()">Courses</a>
      <a mat-list-item routerLink="/consultations" (click)="sidenav.close()">Consultations</a>
    </mat-nav-list>
  </mat-sidenav>

  <mat-sidenav-content>
    <mat-toolbar>
      <span>Help4Kids</span>
      <span class="spacer"></span>
      <button mat-icon-button (click)="sidenav.toggle()">
        <mat-icon>menu</mat-icon>
      </button>
    </mat-toolbar>
    <router-outlet />
  </mat-sidenav-content>
</mat-sidenav-container>
```

### Tabs (for Profile page)

```html
<mat-tab-group dynamicHeight>
  <mat-tab label="My Orders">
    <ng-template matTabContent>
      <!-- lazy-loaded tab content -->
      <app-orders-list [orders]="orders$ | async" />
    </ng-template>
  </mat-tab>
  <mat-tab label="My Courses">
    <ng-template matTabContent>
      <app-courses-list [courses]="myCourses$ | async" />
    </ng-template>
  </mat-tab>
</mat-tab-group>
```

---

## Material Icons

```html
<!-- Use any Material icon by name -->
<mat-icon>home</mat-icon>
<mat-icon>medical_services</mat-icon>
<mat-icon>school</mat-icon>
<mat-icon>person</mat-icon>
<mat-icon>shopping_cart</mat-icon>
<mat-icon>calendar_today</mat-icon>
<mat-icon>article</mat-icon>
```

Browse all icons at [fonts.google.com/icons](https://fonts.google.com/icons).

---

## Further Reading

- [Angular Material Documentation](https://material.angular.io/components) — full component API reference
- [Angular Material Theming](https://material.angular.io/guide/theming) — creating custom themes
- [Material Design 3 Guidelines](https://m3.material.io) — design principles
- [Angular CDK](https://material.angular.io/cdk/categories) — utilities (BreakpointObserver, DragDrop, etc.)

---

> **Prev:** [11 — Forms](11_forms.md) | **Next:** [Part 2 — Project Setup →](../part2/01_project_setup.md)

---

# Part 1 Complete!

You now have all the Angular fundamentals needed to start the migration. In Part 2 you will apply every concept from Part 1 to rebuild Help4Kids in Angular, screen by screen.
