# Part 2 — 09: Admin Module

> **Prev:** [08 — Migrating Screens](08_screens.md) | **Next:** [10 — Shared Components](10_shared.md)

The admin module is lazy-loaded and guarded by `adminGuard`. It mirrors the Flutter admin screens with reactive forms for CRUD operations.

---

## Admin Dashboard

```typescript
// src/app/features/admin/dashboard/admin-dashboard.component.ts
@Component({
  standalone: true,
  selector: 'app-admin-dashboard',
  templateUrl: './admin-dashboard.component.html',
  imports: [RouterLink, MatButtonModule, MatIconModule, MatCardModule, MatListModule],
})
export class AdminDashboardComponent {
  sections = [
    { label: 'Courses', icon: 'school', createPath: '/admin/courses/create' },
    { label: 'Consultations', icon: 'medical_services', createPath: '/admin/consultations/create' },
    { label: 'Articles', icon: 'article', createPath: '/admin/articles/create' },
    { label: 'Services', icon: 'category', createPath: '/admin/services/create' },
    { label: 'Staff', icon: 'people', createPath: '/admin/staff/create' },
  ];
}
```

```html
<!-- admin-dashboard.component.html -->
<div class="admin-dashboard">
  <h1>Admin Dashboard</h1>

  <div class="sections-grid">
    @for (section of sections; track section.label) {
      <mat-card>
        <mat-card-header>
          <mat-icon mat-card-avatar>{{ section.icon }}</mat-icon>
          <mat-card-title>{{ section.label }}</mat-card-title>
        </mat-card-header>
        <mat-card-actions>
          <button mat-raised-button color="primary" [routerLink]="section.createPath">
            <mat-icon>add</mat-icon>
            Create {{ section.label | slice:0:-1 }}
          </button>
        </mat-card-actions>
      </mat-card>
    }
  </div>
</div>
```

---

## Create Course Form

```typescript
// src/app/features/admin/courses/create/create-course.component.ts
@Component({
  standalone: true,
  selector: 'app-create-course',
  templateUrl: './create-course.component.html',
  imports: [
    ReactiveFormsModule, MatFormFieldModule, MatInputModule,
    MatButtonModule, MatCheckboxModule, MatProgressSpinnerModule,
    MatIconModule, RouterLink,
  ],
})
export class CreateCourseComponent {
  form = this.fb.group({
    title: ['', [Validators.required, Validators.maxLength(100)]],
    shortDescription: ['', [Validators.required, Validators.maxLength(300)]],
    longDescription: [''],
    price: [0, [Validators.required, Validators.min(0)]],
    duration: [null as number | null, Validators.min(1)],
    contentUrl: ['', Validators.required],
    icon: ['school'],
    featured: [false],
  });

  imagePreview: string | null = null;
  isSaving = false;

  constructor(
    private fb: FormBuilder,
    private adminService: AdminService,
    private api: ApiService,
  ) {}

  onImageSelected(event: Event): void {
    const file = (event.target as HTMLInputElement).files?.[0];
    if (!file) return;

    // Preview
    const reader = new FileReader();
    reader.onload = () => this.imagePreview = reader.result as string;
    reader.readAsDataURL(file);

    // Upload
    this.api.uploadImage(file).subscribe(res => {
      this.form.patchValue({ icon: res.url });
    });
  }

  onSubmit(): void {
    if (this.form.invalid) {
      this.form.markAllAsTouched();
      return;
    }

    this.isSaving = true;
    this.adminService.createCourse(this.form.value as CreateCourseDto);
    // adminService.saving$ will flip back to false after response
  }
}
```

```html
<!-- create-course.component.html -->
<div class="admin-form-page">
  <div class="form-header">
    <button mat-icon-button routerLink="/admin">
      <mat-icon>arrow_back</mat-icon>
    </button>
    <h1>Create Course</h1>
  </div>

  <form [formGroup]="form" (ngSubmit)="onSubmit()" class="admin-form">

    <mat-form-field appearance="outline">
      <mat-label>Title</mat-label>
      <input matInput formControlName="title" />
      <mat-error *ngIf="form.get('title')?.hasError('required')">Required</mat-error>
      <mat-error *ngIf="form.get('title')?.hasError('maxlength')">Max 100 characters</mat-error>
    </mat-form-field>

    <mat-form-field appearance="outline">
      <mat-label>Short Description</mat-label>
      <textarea matInput formControlName="shortDescription" rows="3"></textarea>
      <mat-hint align="end">{{ form.get('shortDescription')?.value?.length ?? 0 }}/300</mat-hint>
    </mat-form-field>

    <mat-form-field appearance="outline">
      <mat-label>Long Description (HTML)</mat-label>
      <textarea matInput formControlName="longDescription" rows="8"></textarea>
    </mat-form-field>

    <div class="form-row">
      <mat-form-field appearance="outline">
        <mat-label>Price (UAH)</mat-label>
        <input matInput type="number" formControlName="price" min="0" />
      </mat-form-field>

      <mat-form-field appearance="outline">
        <mat-label>Duration (minutes)</mat-label>
        <input matInput type="number" formControlName="duration" min="1" />
      </mat-form-field>
    </div>

    <mat-form-field appearance="outline">
      <mat-label>Video URL</mat-label>
      <input matInput formControlName="contentUrl" type="url" />
    </mat-form-field>

    <!-- Image upload -->
    <div class="image-upload">
      <label>Course Image</label>
      <input type="file" accept="image/*" (change)="onImageSelected($event)" #fileInput hidden />
      <button mat-stroked-button type="button" (click)="fileInput.click()">
        <mat-icon>upload</mat-icon>
        Upload Image
      </button>
      @if (imagePreview) {
        <img [src]="imagePreview" class="image-preview" alt="Preview" />
      }
    </div>

    <mat-checkbox formControlName="featured">Featured on homepage</mat-checkbox>

    <div class="form-actions">
      <button mat-button type="button" routerLink="/admin">Cancel</button>
      <button mat-raised-button color="primary" type="submit" [disabled]="isSaving">
        @if (isSaving) { <mat-spinner diameter="20" /> } @else { Create Course }
      </button>
    </div>

  </form>
</div>
```

---

## Edit Course (reuse the form)

```typescript
// edit-course.component.ts — extends the same pattern with pre-populated form
@Component({ ... })
export class EditCourseComponent implements OnInit {
  @Input() id!: string;

  form = this.fb.group({ /* same as create */ });
  isSaving = false;
  isLoading = true;

  ngOnInit(): void {
    this.api.getCourseById(this.id).subscribe(course => {
      this.form.patchValue(course);  // fills all matching fields
      this.isLoading = false;
    });
  }

  onSubmit(): void {
    if (this.form.invalid) return;
    this.isSaving = true;
    this.adminService.updateCourse(this.id, this.form.value as UpdateCourseDto);
  }

  onDelete(): void {
    if (!confirm('Delete this course?')) return;
    this.adminService.deleteCourse(this.id).subscribe(() => {
      this.router.navigate(['/admin']);
    });
  }
}
```

---

## Reusable Admin Form Pattern

To avoid duplicating form logic between create and edit, extract a shared form component:

```typescript
// course-form.component.ts — shared between create and edit
@Component({
  standalone: true,
  selector: 'app-course-form',
  inputs: ['initialValue', 'isSaving'],
  outputs: ['formSubmit'],
  template: `<form [formGroup]="form" (ngSubmit)="onSubmit()">...</form>`,
})
export class CourseFormComponent {
  @Input() set initialValue(val: Partial<Course> | null) {
    if (val) this.form.patchValue(val);
  }
  @Input() isSaving = false;
  @Output() formSubmit = new EventEmitter<CreateCourseDto>();

  form = this.fb.group({ ... });

  constructor(private fb: FormBuilder) {}

  onSubmit(): void {
    if (this.form.valid) this.formSubmit.emit(this.form.value as CreateCourseDto);
  }
}
```

---

## Further Reading

- [Reactive Forms](https://angular.dev/guide/forms/reactive-forms)
- [File Upload with HttpClient](https://angular.dev/guide/http/making-requests#making-a-post-request)
- [FormBuilder](https://angular.dev/api/forms/FormBuilder)

---

> **Prev:** [08 — Migrating Screens](08_screens.md) | **Next:** [10 — Shared Components](10_shared.md)
