# Part 2 — 10: Shared Components

> **Prev:** [09 — Admin Module](09_admin.md) | **Next:** [11 — Responsive Design](11_responsive.md)

Shared components map directly to the widgets in `presentation/pages/widgets/` and `presentation/widgets/`.

---

## Header Component

```typescript
// src/app/shared/components/header/header.component.ts
@Component({
  standalone: true,
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [
    RouterLink, RouterLinkActive, AsyncPipe, CommonModule,
    MatButtonModule, MatIconModule, MatMenuModule, MatToolbarModule,
    MatSidenavModule,
  ],
})
export class HeaderComponent {
  user$ = this.auth.user$;
  isAdmin$ = this.auth.isAdmin$;

  navLinks = [
    { path: '/services', label: 'Services' },
    { path: '/courses', label: 'Courses' },
    { path: '/consultations', label: 'Consultations' },
    { path: '/articles', label: 'Articles' },
  ];

  constructor(
    private auth: AuthService,
    private dialog: MatDialog,
  ) {}

  openLogin(): void {
    this.dialog.open(LoginComponent, { width: '440px' });
  }
}
```

```html
<!-- header.component.html -->
<mat-toolbar class="header" color="primary">
  <a routerLink="/" class="brand">
    <img src="/assets/logo.svg" alt="Help4Kids" height="40" />
  </a>

  <!-- Desktop nav -->
  <nav class="desktop-nav">
    @for (link of navLinks; track link.path) {
      <a [routerLink]="link.path"
         routerLinkActive="nav-link--active"
         class="nav-link">
        {{ link.label }}
      </a>
    }
  </nav>

  <span class="spacer"></span>

  <!-- Auth buttons -->
  @if (user$ | async; as user) {
    <button mat-button [matMenuTriggerFor]="userMenu">
      <mat-icon>account_circle</mat-icon>
      {{ user.firstName }}
    </button>
    <mat-menu #userMenu>
      <button mat-menu-item routerLink="/profile">
        <mat-icon>person</mat-icon>My Profile
      </button>
      @if (isAdmin$ | async) {
        <button mat-menu-item routerLink="/admin">
          <mat-icon>admin_panel_settings</mat-icon>Admin
        </button>
      }
      <mat-divider />
      <button mat-menu-item (click)="auth.logout()">
        <mat-icon>logout</mat-icon>Logout
      </button>
    </mat-menu>
  } @else {
    <button mat-button (click)="openLogin()">Sign In</button>
    <button mat-raised-button routerLink="/register">Register</button>
  }

  <!-- Mobile menu button (hidden on desktop via CSS) -->
  <button mat-icon-button class="mobile-menu-btn" (click)="drawer.toggle()">
    <mat-icon>menu</mat-icon>
  </button>
</mat-toolbar>
```

```scss
// header.component.scss
.header { position: sticky; top: 0; z-index: 100; }
.brand { display: flex; align-items: center; text-decoration: none; }
.spacer { flex: 1; }
.desktop-nav { display: flex; gap: 0.5rem; }
.nav-link { color: white; text-decoration: none; padding: 0.25rem 0.75rem; border-radius: 4px; }
.nav-link--active { background: rgba(255,255,255,0.2); }

.mobile-menu-btn { display: none; }

@media (max-width: 768px) {
  .desktop-nav { display: none; }
  .mobile-menu-btn { display: flex; }
}
```

---

## Footer Component

```typescript
// src/app/shared/components/footer/footer.component.ts
@Component({
  standalone: true,
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [RouterLink, AsyncPipe, NgFor, MatIconModule],
})
export class FooterComponent {
  socialContacts$ = this.appState.socialContacts$;
  units$ = this.appState.units$;

  navLinks = [
    { path: '/services', label: 'Services' },
    { path: '/courses', label: 'Courses' },
    { path: '/consultations', label: 'Consultations' },
    { path: '/articles', label: 'Articles' },
  ];

  constructor(private appState: AppStateService) {}

  currentYear = new Date().getFullYear();
}
```

```html
<!-- footer.component.html -->
<footer class="footer">
  <div class="footer-grid">
    <div class="footer-brand">
      <img src="/assets/logo-white.svg" alt="Help4Kids" height="48" />
      <p>Pediatric medical clinic providing quality healthcare for children.</p>
    </div>

    <div class="footer-nav">
      <h4>Navigation</h4>
      <ul>
        @for (link of navLinks; track link.path) {
          <li><a [routerLink]="link.path">{{ link.label }}</a></li>
        }
      </ul>
    </div>

    <div class="footer-stats">
      <h4>Our Results</h4>
      @for (unit of units$ | async; track unit.label) {
        <div class="stat">
          <strong>{{ unit.value }}</strong>
          <span>{{ unit.label }}</span>
        </div>
      }
    </div>

    <div class="footer-social">
      <h4>Follow Us</h4>
      @for (contact of socialContacts$ | async; track contact.platform) {
        <a [href]="contact.url" target="_blank" rel="noopener">
          <mat-icon>{{ contact.icon ?? 'link' }}</mat-icon>
          {{ contact.platform }}
        </a>
      }
    </div>
  </div>

  <div class="footer-bottom">
    <p>© {{ currentYear }} Help4Kids. All rights reserved.</p>
  </div>
</footer>
```

---

## Course Card Component

```typescript
// src/app/shared/components/course-card/course-card.component.ts
@Component({
  standalone: true,
  selector: 'app-course-card',
  templateUrl: './course-card.component.html',
  styleUrls: ['./course-card.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [MatCardModule, MatButtonModule, MatIconModule, MatChipsModule, CurrencyPipe, NgIf],
})
export class CourseCardComponent {
  @Input({ required: true }) course!: Course;
  @Input() purchased = false;
  @Output() buy = new EventEmitter<Course>();
}
```

```html
<!-- course-card.component.html -->
<mat-card class="course-card" [class.purchased]="purchased">
  @if (course.featured) {
    <mat-chip class="featured-badge" color="accent" highlighted>Featured</mat-chip>
  }

  <img mat-card-image
       [src]="course.image ?? '/assets/course-placeholder.jpg'"
       [alt]="course.title" />

  <mat-card-header>
    <mat-card-title>{{ course.title }}</mat-card-title>
    <mat-card-subtitle>
      {{ course.price | currency:'UAH':'symbol':'1.0-0' }}
      @if (course.duration) { · {{ course.duration }} min }
    </mat-card-subtitle>
  </mat-card-header>

  <mat-card-content>
    <p>{{ course.shortDescription }}</p>
  </mat-card-content>

  <mat-card-actions align="end">
    @if (purchased) {
      <button mat-stroked-button disabled>
        <mat-icon>check</mat-icon> Purchased
      </button>
    } @else {
      <button mat-raised-button color="primary" (click)="buy.emit(course)">
        Buy — {{ course.price | currency:'UAH':'symbol':'1.0-0' }}
      </button>
    }
  </mat-card-actions>
</mat-card>
```

---

## Order Card Component

```typescript
// src/app/shared/components/order-card/order-card.component.ts
@Component({
  standalone: true,
  selector: 'app-order-card',
  template: `
    <mat-card class="order-card">
      <mat-card-header>
        <mat-card-title>{{ order.serviceType | titlecase }}</mat-card-title>
        <mat-card-subtitle>
          {{ order.createdAt | date:'dd MMM yyyy' }}
        </mat-card-subtitle>
        <span class="status-badge" [class]="'status-' + order.status">
          {{ order.status | orderStatus }}
        </span>
      </mat-card-header>
      <mat-card-content>
        <p class="amount">{{ order.amount | currency:'UAH':'symbol':'1.0-0' }}</p>
      </mat-card-content>
    </mat-card>
  `,
  imports: [MatCardModule, DatePipe, CurrencyPipe, TitleCasePipe, OrderStatusPipe],
})
export class OrderCardComponent {
  @Input({ required: true }) order!: Order;
}
```

---

## Pipes

### SafeHtml Pipe (replaces flutter_html)

```typescript
// src/app/shared/pipes/safe-html.pipe.ts
import { Pipe, PipeTransform } from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';
import DOMPurify from 'dompurify';

@Pipe({ name: 'safeHtml', standalone: true })
export class SafeHtmlPipe implements PipeTransform {
  constructor(private sanitizer: DomSanitizer) {}

  transform(value: string | null | undefined): SafeHtml {
    if (!value) return '';
    const clean = DOMPurify.sanitize(value, {
      ALLOWED_TAGS: ['p', 'br', 'strong', 'em', 'ul', 'ol', 'li', 'h2', 'h3', 'a', 'img'],
      ALLOWED_ATTR: ['href', 'src', 'alt', 'target'],
    });
    return this.sanitizer.bypassSecurityTrustHtml(clean);
  }
}
```

### OrderStatus Pipe

```typescript
// src/app/shared/pipes/order-status.pipe.ts
@Pipe({ name: 'orderStatus', standalone: true })
export class OrderStatusPipe implements PipeTransform {
  transform(status: OrderStatus): string {
    const labels: Record<OrderStatus, string> = {
      pending: 'Processing',
      paid: 'Paid',
      failed: 'Failed',
    };
    return labels[status] ?? status;
  }
}
```

---

> **Prev:** [09 — Admin Module](09_admin.md) | **Next:** [11 — Responsive Design](11_responsive.md)
