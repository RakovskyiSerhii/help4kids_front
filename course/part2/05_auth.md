# Part 2 — 05: Auth Module

> **Prev:** [04 — API Service](04_api_service.md) | **Next:** [06 — Routing](06_routing.md)

**Flutter:** `ValueCarrier<bool>` + `AuthStateHandlerBloc` + `AuthStateHandlerWidget`
**Angular:** `AuthService` with `BehaviorSubject<User | null>` + interceptor + guards

Angular collapses three Flutter classes into one service and two small functions.

---

## AuthService

```typescript
// src/app/core/services/auth.service.ts
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { map } from 'rxjs/operators';
import { ApiService } from '../../data/services/api.service';
import { User } from '../../data/models';

@Injectable({ providedIn: 'root' })
export class AuthService {
  // BehaviorSubject<User | null> replaces ValueCarrier<bool>
  // Holds the full user object, not just a bool — more powerful
  private userSubject = new BehaviorSubject<User | null>(this.loadFromStorage());

  // Public observables
  user$ = this.userSubject.asObservable();
  isLoggedIn$ = this.user$.pipe(map(u => u !== null));
  isAdmin$ = this.user$.pipe(map(u => u?.roleId === 'admin'));

  // Synchronous getters for guards (guards run outside async context)
  get isLoggedIn(): boolean { return !!this.userSubject.getValue(); }
  get isAdmin(): boolean { return this.userSubject.getValue()?.roleId === 'admin'; }
  get currentUser(): User | null { return this.userSubject.getValue(); }

  constructor(
    private api: ApiService,
    private router: Router,
  ) {}

  login(email: string, password: string): Observable<User> {
    return this.api.login(email, password).pipe(
      tap(user => this.setUser(user))
    );
  }

  register(data: {
    email: string;
    password: string;
    firstName: string;
    lastName: string;
    phone?: string;
  }): Observable<User> {
    return this.api.register(data).pipe(
      tap(user => this.setUser(user))
    );
  }

  logout(): void {
    localStorage.removeItem('auth_user');
    localStorage.removeItem('auth_token');
    this.userSubject.next(null);
    this.router.navigate(['/']);
  }

  // Called by interceptor
  getToken(): string | null {
    return localStorage.getItem('auth_token');
  }

  refreshProfile(): Observable<User> {
    return this.api.getProfile().pipe(
      tap(user => this.userSubject.next(user))
    );
  }

  private setUser(user: User): void {
    // If backend returns a token in the user object, extract it
    // For now store user data for display; token stored separately
    localStorage.setItem('auth_user', JSON.stringify(user));
    this.userSubject.next(user);
  }

  private loadFromStorage(): User | null {
    const raw = localStorage.getItem('auth_user');
    if (!raw) return null;
    try {
      return JSON.parse(raw) as User;
    } catch {
      return null;
    }
  }
}
```

---

## Auth Interceptor

Replaces Dio's interceptor that adds the `Authorization` header and handles 401:

```typescript
// src/app/core/interceptors/auth.interceptor.ts
import { HttpInterceptorFn, HttpErrorResponse } from '@angular/common/http';
import { inject } from '@angular/core';
import { catchError, throwError } from 'rxjs';
import { AuthService } from '../services/auth.service';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const auth = inject(AuthService);
  const token = auth.getToken();

  const authReq = token
    ? req.clone({ headers: req.headers.set('Authorization', `Bearer ${token}`) })
    : req;

  return next(authReq).pipe(
    catchError((err: HttpErrorResponse) => {
      if (err.status === 401 && auth.isLoggedIn) {
        // Token expired — log out and redirect
        auth.logout();
      }
      return throwError(() => err);
    })
  );
};
```

---

## Route Guards

Replace GoRouter's `redirect` function:

```typescript
// src/app/core/guards/auth.guard.ts
import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const authGuard: CanActivateFn = (route) => {
  const auth = inject(AuthService);
  const router = inject(Router);

  if (auth.isLoggedIn) return true;

  // Preserve the intended URL for redirect after login
  const returnUrl = route.url.map(s => s.path).join('/');
  return router.createUrlTree(['/'], { queryParams: { returnUrl } });
};
```

```typescript
// src/app/core/guards/admin.guard.ts
import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const adminGuard: CanActivateFn = () => {
  const auth = inject(AuthService);
  const router = inject(Router);

  if (auth.isAdmin) return true;
  return router.createUrlTree(['/']);
};
```

---

## Login Component

```typescript
// src/app/features/auth/login/login.component.ts
@Component({
  standalone: true,
  selector: 'app-login',
  templateUrl: './login.component.html',
  imports: [ReactiveFormsModule, MatFormFieldModule, MatInputModule,
            MatButtonModule, MatProgressSpinnerModule, RouterLink],
})
export class LoginComponent {
  form = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', [Validators.required, Validators.minLength(6)]],
  });

  isSubmitting = false;
  errorMessage = '';
  hidePassword = true;

  constructor(
    private fb: FormBuilder,
    private auth: AuthService,
    private router: Router,
    private route: ActivatedRoute,
  ) {}

  onSubmit(): void {
    if (this.form.invalid) return;
    this.isSubmitting = true;
    this.errorMessage = '';

    const { email, password } = this.form.value;

    this.auth.login(email!, password!).subscribe({
      next: () => {
        const returnUrl = this.route.snapshot.queryParamMap.get('returnUrl') ?? '/profile';
        this.router.navigateByUrl(returnUrl);
      },
      error: (err: HttpErrorResponse) => {
        this.errorMessage = err.status === 401
          ? 'Invalid email or password'
          : 'Login failed. Please try again.';
        this.isSubmitting = false;
      },
    });
  }
}
```

```html
<!-- login.component.html -->
<div class="auth-page">
  <mat-card class="auth-card">
    <mat-card-header>
      <mat-card-title>Sign In</mat-card-title>
    </mat-card-header>

    <mat-card-content>
      <form [formGroup]="form" (ngSubmit)="onSubmit()">
        <mat-form-field appearance="outline" class="full-width">
          <mat-label>Email</mat-label>
          <input matInput type="email" formControlName="email" autocomplete="email" />
          <mat-error *ngIf="form.get('email')?.hasError('email')">Invalid email</mat-error>
        </mat-form-field>

        <mat-form-field appearance="outline" class="full-width">
          <mat-label>Password</mat-label>
          <input matInput [type]="hidePassword ? 'password' : 'text'" formControlName="password" />
          <button mat-icon-button matSuffix type="button" (click)="hidePassword = !hidePassword">
            <mat-icon>{{ hidePassword ? 'visibility_off' : 'visibility' }}</mat-icon>
          </button>
        </mat-form-field>

        @if (errorMessage) {
          <p class="error-message">{{ errorMessage }}</p>
        }

        <button mat-raised-button color="primary" type="submit"
                class="full-width" [disabled]="form.invalid || isSubmitting">
          @if (isSubmitting) { <mat-spinner diameter="20" /> } @else { Sign In }
        </button>
      </form>
    </mat-card-content>

    <mat-card-actions>
      <p>No account? <a routerLink="/register">Register</a></p>
    </mat-card-actions>
  </mat-card>
</div>
```

---

## Login Dialog (modal — like Flutter's showDialog)

If you want login as a modal overlay rather than a separate page:

```typescript
// header.component.ts
export class HeaderComponent {
  constructor(private dialog: MatDialog) {}

  openLogin(): void {
    this.dialog.open(LoginComponent, { width: '440px', panelClass: 'auth-dialog' });
  }
}
```

---

## Email Verification Page

```typescript
// src/app/features/auth/verify-email/verify-email.component.ts
@Component({
  standalone: true,
  selector: 'app-verify-email',
  template: `
    @if (status === 'loading') { <mat-spinner /> }
    @else if (status === 'success') {
      <mat-card>
        <mat-card-content>
          <mat-icon color="primary">check_circle</mat-icon>
          <h2>Email verified!</h2>
          <button mat-raised-button routerLink="/">Go Home</button>
        </mat-card-content>
      </mat-card>
    }
    @else {
      <mat-card>
        <mat-card-content>
          <mat-icon color="warn">error</mat-icon>
          <h2>Verification failed</h2>
          <p>{{ errorMessage }}</p>
        </mat-card-content>
      </mat-card>
    }
  `,
  imports: [MatCardModule, MatButtonModule, MatIconModule, MatSpinnerModule, RouterLink],
})
export class VerifyEmailComponent implements OnInit {
  @Input() token!: string;     // from route param via withComponentInputBinding()
  status: 'loading' | 'success' | 'error' = 'loading';
  errorMessage = '';

  constructor(private api: ApiService) {}

  ngOnInit(): void {
    this.api.verifyEmail(this.token).subscribe({
      next: () => this.status = 'success',
      error: err => {
        this.status = 'error';
        this.errorMessage = err.message;
      }
    });
  }
}
```

---

## Flutter → Angular Auth Mapping

| Flutter | Angular |
|---|---|
| `ValueCarrier<bool>` | `BehaviorSubject<User \| null>` |
| `AuthStateHandlerBloc` | `AuthService` (the BehaviorSubject IS the bloc) |
| `AuthStateHandlerWidget` | No equivalent needed — component subscribes directly |
| `_authStateCarrier.stream.listen(...)` | `authService.user$.subscribe(...)` |
| `onUnauthorized: () => _resetNavigator()` | `authInterceptor` → `auth.logout()` → router.navigate |
| GoRouter `redirect` | `canActivate: [authGuard]` |
| `@Injectable()` factory | `@Injectable({ providedIn: 'root' })` singleton |

---

## Further Reading

- [Angular Route Guards](https://angular.dev/guide/routing/common-router-tasks#preventing-unauthorized-access)
- [HTTP Interceptors](https://angular.dev/guide/http/interceptors)
- [Local Storage in Angular](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

---

> **Prev:** [04 — API Service](04_api_service.md) | **Next:** [06 — Routing](06_routing.md)
