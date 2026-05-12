# Part 2 — 08: Migrating Feature Screens

> **Prev:** [07 — State Management](07_state.md) | **Next:** [09 — Admin Module](09_admin.md)

Each Flutter screen becomes an Angular component. The pattern is always: thin component reads from service observables via `async` pipe, triggers actions on user interaction.

---

## Home Screen (HomeCubit → HomeComponent)

```typescript
// src/app/features/home/home.component.ts
@Component({
  standalone: true,
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [
    CommonModule, AsyncPipe, RouterLink,
    HeroComponent, CoursesPreviewComponent,
    ConsultationsPreviewComponent, StaffSectionComponent,
    AboutSectionComponent, MatSpinnerModule,
  ],
})
export class HomeComponent implements OnInit {
  landing$ = this.landingService.landing$;
  loading$ = this.landingService.loading$;
  error$ = this.landingService.error$;

  constructor(private landingService: LandingService) {}

  ngOnInit(): void {
    this.landingService.load();
  }
}
```

```html
<!-- home.component.html -->
@if (loading$ | async) {
  <div class="loading-page"><mat-spinner /></div>
} @else if (error$ | async; as error) {
  <div class="error-page">
    <mat-icon color="warn">error_outline</mat-icon>
    <p>{{ error }}</p>
  </div>
} @else if (landing$ | async; as landing) {
  <app-hero [generalInfo]="landing.generalInfo" />
  <app-courses-preview [courses]="landing.featuredCourses" />
  <app-consultations-preview [consultations]="landing.featuredConsultations" />
  <app-staff-section [staff]="landing.staff" />
  <app-about-section />
}
```

---

## Courses Screen (CoursesScreen → CoursesComponent)

```typescript
// src/app/features/courses/courses.component.ts
@Component({
  standalone: true,
  selector: 'app-courses',
  templateUrl: './courses.component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [CommonModule, AsyncPipe, CourseCardComponent, MatSpinnerModule, MatButtonModule],
})
export class CoursesComponent implements OnInit {
  courses$ = this.courseService.courses$;
  loading$ = this.courseService.loading$;
  myCourseIds$ = this.courseService.myCourses$.pipe(
    map(courses => new Set(courses.map(c => c.id)))
  );

  constructor(
    private courseService: CourseService,
    private orderService: OrderService,
    private authService: AuthService,
    private router: Router,
    private dialog: MatDialog,
  ) {}

  ngOnInit(): void {
    this.courseService.loadCourses();
    if (this.authService.isLoggedIn) {
      this.courseService.loadMyCourses();
    }
  }

  buyCourse(course: Course): void {
    if (!this.authService.isLoggedIn) {
      this.dialog.open(LoginComponent, { width: '440px' });
      return;
    }

    this.orderService.createOrder({
      serviceType: 'course',
      serviceId: course.id,
      amount: course.price,
    }).subscribe(order => {
      if (order.paymentUrl) {
        window.location.href = order.paymentUrl;
      }
    });
  }
}
```

```html
<!-- courses.component.html -->
<div class="page-header">
  <h1>Courses</h1>
</div>

@if (loading$ | async) {
  <div class="center"><mat-spinner /></div>
} @else {
  <div class="courses-grid">
    @for (course of courses$ | async; track course.id) {
      <app-course-card
        [course]="course"
        [purchased]="(myCourseIds$ | async)?.has(course.id) ?? false"
        (buy)="buyCourse($event)"
      />
    } @empty {
      <p class="empty-state">No courses available yet.</p>
    }
  </div>
}
```

---

## Consultations Screen + Detail

```typescript
// consultations.component.ts
@Component({ standalone: true, selector: 'app-consultations', ... })
export class ConsultationsComponent implements OnInit {
  consultations$ = this.consultationService.consultations$;
  loading$ = this.consultationService.loading$;

  constructor(
    private consultationService: ConsultationService,
    private router: Router,
  ) {}

  ngOnInit(): void {
    this.consultationService.loadConsultations();
  }

  viewDetail(id: string): void {
    this.router.navigate(['/consultations', id]);
  }
}
```

```typescript
// consultation-detail.component.ts
@Component({ standalone: true, selector: 'app-consultation-detail', ... })
export class ConsultationDetailComponent implements OnInit {
  @Input() id!: string;   // from route param via withComponentInputBinding()
  consultation$!: Observable<Consultation>;
  isBooked = false;

  constructor(
    private consultationService: ConsultationService,
    private orderService: OrderService,
    private authService: AuthService,
    private toast: ToastService,
  ) {}

  ngOnInit(): void {
    this.consultation$ = this.consultationService.getById(this.id);
  }

  book(consultation: Consultation): void {
    if (!this.authService.isLoggedIn) { /* show login */ return; }

    this.orderService.createOrder({
      serviceType: 'consultation',
      serviceId: consultation.id,
      amount: consultation.price,
    }).subscribe({
      next: order => {
        if (order.paymentUrl) window.location.href = order.paymentUrl;
      },
      error: () => this.toast.error('Booking failed'),
    });
  }
}
```

```html
<!-- consultation-detail.component.html -->
@if (consultation$ | async; as consultation) {
  <div class="consultation-detail">
    <div class="consultation-header">
      <img [src]="consultation.image" [alt]="consultation.title" *ngIf="consultation.image" />
      <div>
        <h1>{{ consultation.title }}</h1>
        <p class="price">{{ consultation.price | currency:'UAH':'symbol':'1.0-0' }}</p>
        @if (consultation.duration) {
          <p class="duration">Duration: {{ consultation.duration }} min</p>
        }
      </div>
    </div>

    <div class="consultation-body">
      <p>{{ consultation.shortDescription }}</p>
      @if (consultation.longDescription) {
        <div [innerHTML]="consultation.longDescription | safeHtml"></div>
      }
    </div>

    <button mat-raised-button color="primary" (click)="book(consultation)">
      Book Now
    </button>
  </div>
} @else {
  <mat-spinner />
}
```

---

## Services Page (with category filter)

```typescript
// services.component.ts
@Component({ standalone: true, selector: 'app-services', ... })
export class ServicesComponent implements OnInit {
  // Reactive filter from URL — survives navigation
  activeCategory$ = this.route.queryParamMap.pipe(
    map(p => p.get('categoryId'))
  );

  filteredServices$ = this.activeCategory$.pipe(
    switchMap(categoryId => this.serviceCatalog.filteredServices$(categoryId))
  );

  categories$ = this.appState.categories$;
  loading$ = this.serviceCatalog.loading$;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private serviceCatalog: ServiceCatalogService,
    private appState: AppStateService,
  ) {}

  ngOnInit(): void {
    this.serviceCatalog.loadServices();
  }

  selectCategory(categoryId: string | null): void {
    this.router.navigate(['/services'], {
      queryParams: categoryId ? { categoryId } : {},
    });
  }
}
```

```html
<!-- services.component.html -->
<div class="services-page">
  <!-- Category filter chips -->
  <div class="category-filters">
    <mat-chip (click)="selectCategory(null)">All</mat-chip>
    @for (cat of categories$ | async; track cat.id) {
      <mat-chip
        [highlighted]="(activeCategory$ | async) === cat.id"
        (click)="selectCategory(cat.id)">
        {{ cat.name }}
      </mat-chip>
    }
  </div>

  @if (loading$ | async) {
    <mat-spinner />
  } @else {
    <div class="services-grid">
      @for (service of filteredServices$ | async; track service.id) {
        <app-service-card [service]="service" />
      } @empty {
        <p>No services in this category.</p>
      }
    </div>
  }
</div>
```

---

## Profile Screen (ProfileScreen → ProfileComponent)

```typescript
// profile.component.ts
@Component({ standalone: true, selector: 'app-profile', ... })
export class ProfileComponent implements OnInit {
  user$ = this.auth.user$;
  orders$ = this.orderService.myOrders$;
  myCourses$ = this.courseService.myCourses$;

  constructor(
    private auth: AuthService,
    private orderService: OrderService,
    private courseService: CourseService,
  ) {}

  ngOnInit(): void {
    this.orderService.loadMyOrders();
    this.courseService.loadMyCourses();
  }

  logout(): void {
    this.auth.logout();
  }
}
```

```html
<!-- profile.component.html -->
@if (user$ | async; as user) {
  <div class="profile-page">
    <!-- Header -->
    <div class="profile-header">
      <div class="avatar">{{ user.firstName[0] }}{{ user.lastName[0] }}</div>
      <div>
        <h2>{{ user.firstName }} {{ user.lastName }}</h2>
        <p>{{ user.email }}</p>
      </div>
      <button mat-stroked-button (click)="logout()">
        <mat-icon>logout</mat-icon>
        Logout
      </button>
    </div>

    <!-- Tabs -->
    <mat-tab-group dynamicHeight>
      <mat-tab label="My Orders">
        <ng-template matTabContent>
          @for (order of orders$ | async; track order.id) {
            <app-order-card [order]="order" />
          } @empty {
            <p class="empty-state">No orders yet.</p>
          }
        </ng-template>
      </mat-tab>

      <mat-tab label="My Courses">
        <ng-template matTabContent>
          @for (course of myCourses$ | async; track course.id) {
            <app-course-card [course]="course" [purchased]="true" />
          } @empty {
            <p class="empty-state">You haven't purchased any courses yet.</p>
          }
        </ng-template>
      </mat-tab>
    </mat-tab-group>
  </div>
}
```

---

## Payment Success Page

```typescript
// payment-success.component.ts
@Component({
  standalone: true,
  selector: 'app-payment-success',
  template: `
    <div class="success-page">
      <mat-icon class="success-icon" color="primary">check_circle</mat-icon>
      <h1>Payment Successful!</h1>
      <p>Your order has been confirmed.</p>
      <div class="actions">
        <button mat-raised-button color="primary" routerLink="/profile">
          View My Orders
        </button>
        <button mat-stroked-button routerLink="/">
          Back to Home
        </button>
      </div>
    </div>
  `,
  imports: [MatIconModule, MatButtonModule, RouterLink],
})
export class PaymentSuccessComponent {}
```

---

> **Prev:** [07 — State Management](07_state.md) | **Next:** [09 — Admin Module](09_admin.md)
