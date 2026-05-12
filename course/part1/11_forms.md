# 11 — Forms

> **Prev:** [10 — State Management](10_state_management.md) | **Next:** [12 — Angular Material](12_angular_material.md)

Angular has two form approaches. **Reactive Forms** are the equivalent of Flutter's `FormBuilder` — type-safe, testable, driven by TypeScript. **Template-driven** are simpler but harder to test. Use Reactive Forms for everything in Help4Kids.

---

## Setup

```typescript
// app.config.ts — no setup needed for Reactive Forms
// Just import ReactiveFormsModule in your component

@Component({
  standalone: true,
  imports: [ReactiveFormsModule, MatFormFieldModule, MatInputModule, MatButtonModule],
})
export class LoginComponent {}
```

---

## Reactive Forms — Core Concepts

```
Flutter                          Angular Reactive Forms
────────────────────────────────────────────────────────
FormGroup(fields: {...})    →    new FormGroup({...}) / fb.group({...})
FormControl(...)            →    new FormControl<T>(initial, validators)
FormArray(...)              →    new FormArray([...])
Validators.required         →    Validators.required
form.valid                  →    form.valid
form.value                  →    form.value
controller.text             →    control.value
TextEditingController       →    FormControl<string>
```

---

## Login Form Example

```typescript
// login.component.ts
import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';

@Component({
  standalone: true,
  selector: 'app-login',
  templateUrl: './login.component.html',
  imports: [ReactiveFormsModule, MatFormFieldModule, MatInputModule, MatButtonModule,
            MatProgressSpinnerModule, AsyncPipe],
})
export class LoginComponent {
  form = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', [Validators.required, Validators.minLength(6)]],
  });

  isSubmitting = false;
  error = '';

  constructor(
    private fb: FormBuilder,
    private auth: AuthService,
    private router: Router,
  ) {}

  onSubmit(): void {
    if (this.form.invalid) return;
    this.isSubmitting = true;
    this.error = '';

    const { email, password } = this.form.value;

    this.auth.login(email!, password!).subscribe({
      next: () => this.router.navigate(['/profile']),
      error: err => {
        this.error = err.status === 401 ? 'Invalid credentials' : 'Login failed';
        this.isSubmitting = false;
      },
    });
  }
}
```

```html
<!-- login.component.html -->
<form [formGroup]="form" (ngSubmit)="onSubmit()" class="login-form">
  <h2>Sign In</h2>

  <mat-form-field appearance="outline">
    <mat-label>Email</mat-label>
    <input matInput type="email" formControlName="email" autocomplete="email" />
    <mat-error *ngIf="form.get('email')?.hasError('required')">Email is required</mat-error>
    <mat-error *ngIf="form.get('email')?.hasError('email')">Invalid email address</mat-error>
  </mat-form-field>

  <mat-form-field appearance="outline">
    <mat-label>Password</mat-label>
    <input matInput type="password" formControlName="password" autocomplete="current-password" />
    <mat-error *ngIf="form.get('password')?.hasError('required')">Password is required</mat-error>
    <mat-error *ngIf="form.get('password')?.hasError('minlength')">Minimum 6 characters</mat-error>
  </mat-form-field>

  <p *ngIf="error" class="form-error">{{ error }}</p>

  <button mat-raised-button color="primary" type="submit"
          [disabled]="form.invalid || isSubmitting">
    @if (isSubmitting) {
      <mat-spinner diameter="20" />
    } @else {
      Sign In
    }
  </button>
</form>
```

---

## Registration Form

```typescript
form = this.fb.group({
  firstName: ['', [Validators.required, Validators.minLength(2)]],
  lastName: ['', [Validators.required, Validators.minLength(2)]],
  email: ['', [Validators.required, Validators.email]],
  phone: ['', [Validators.pattern(/^\+?[\d\s-]{10,15}$/)]],
  password: ['', [Validators.required, Validators.minLength(6)]],
  confirmPassword: ['', Validators.required],
}, {
  validators: this.passwordsMatch,   // group-level validator
});

// Custom group validator
passwordsMatch(group: AbstractControl): ValidationErrors | null {
  const password = group.get('password')?.value;
  const confirm = group.get('confirmPassword')?.value;
  return password === confirm ? null : { passwordMismatch: true };
}
```

```html
<!-- Show group-level error -->
<mat-error *ngIf="form.hasError('passwordMismatch') && form.get('confirmPassword')?.touched">
  Passwords do not match
</mat-error>
```

---

## Admin Course Form

```typescript
// create-course.component.ts
form = this.fb.group({
  title: ['', [Validators.required, Validators.maxLength(100)]],
  shortDescription: ['', [Validators.required, Validators.maxLength(300)]],
  longDescription: [''],
  price: [0, [Validators.required, Validators.min(0)]],
  duration: [null as number | null],
  contentUrl: ['', Validators.required],
  featured: [false],
});

get titleErrors(): string | null {
  const ctrl = this.form.get('title')!;
  if (ctrl.hasError('required')) return 'Title is required';
  if (ctrl.hasError('maxlength')) return 'Max 100 characters';
  return null;
}

// Typed form access (Angular 14+)
get titleControl() { return this.form.controls.title; }
```

---

## Built-in Validators

```typescript
import { Validators } from '@angular/forms';

Validators.required                    // field must have value
Validators.email                       // valid email format
Validators.minLength(n)               // string length >= n
Validators.maxLength(n)               // string length <= n
Validators.min(n)                     // number >= n
Validators.max(n)                     // number <= n
Validators.pattern(regex)             // matches regex
Validators.requiredTrue               // must be true (checkboxes)
```

---

## Custom Validator

```typescript
import { AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';

// Reusable validator factory
export function urlValidator(): ValidatorFn {
  return (control: AbstractControl): ValidationErrors | null => {
    if (!control.value) return null;  // let required handle empty
    try {
      new URL(control.value);
      return null;  // valid
    } catch {
      return { invalidUrl: true };
    }
  };
}

// Usage
contentUrl: ['', [Validators.required, urlValidator()]],
```

---

## Accessing Form State

```typescript
const ctrl = this.form.get('email')!;

ctrl.value           // current value
ctrl.valid           // all validators pass
ctrl.invalid         // any validator fails
ctrl.pristine        // user hasn't interacted
ctrl.dirty           // user has changed value
ctrl.touched         // user has focused and left
ctrl.untouched       // user hasn't focused yet
ctrl.errors          // { required: true } | { email: true } | null

// Programmatic updates
ctrl.setValue('new@email.com');   // set value, marks as dirty
ctrl.patchValue('new@email.com'); // partial update
ctrl.reset();                     // reset to initial value
ctrl.disable();                   // disable field
ctrl.enable();                    // re-enable
```

---

## FormArray (dynamic lists)

```typescript
// Admin: manage multiple staff members
form = this.fb.group({
  staffIds: this.fb.array<string>([]),
});

get staffArray() {
  return this.form.get('staffIds') as FormArray;
}

addStaff(): void {
  this.staffArray.push(this.fb.control(''));
}

removeStaff(i: number): void {
  this.staffArray.removeAt(i);
}
```

```html
<div formArrayName="staffIds">
  @for (ctrl of staffArray.controls; track $index; let i = $index) {
    <mat-form-field>
      <input matInput [formControlName]="i" placeholder="Staff ID" />
      <button mat-icon-button matSuffix (click)="removeStaff(i)">
        <mat-icon>delete</mat-icon>
      </button>
    </mat-form-field>
  }
  <button mat-button (click)="addStaff()">+ Add Staff</button>
</div>
```

---

## Further Reading

- [Reactive Forms Guide](https://angular.dev/guide/forms/reactive-forms) — official, thorough
- [Form Validation](https://angular.dev/guide/forms/form-validation) — built-in and custom validators
- [Typed Forms (Angular 14+)](https://angular.dev/guide/forms/typed-forms) — strongly typed FormControl<T>
- [Dynamic Forms](https://angular.dev/guide/forms/dynamic-forms) — FormArray and building forms from config

---

> **Prev:** [10 — State Management](10_state_management.md) | **Next:** [12 — Angular Material](12_angular_material.md)
