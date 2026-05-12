# Part 2 — 04: API Service Layer

> **Prev:** [03 — Data Models](03_models.md) | **Next:** [05 — Auth Module](05_auth.md)

**Flutter:** `lib/data/network/api.dart` (Dio-based `ApiClient`) + 8 repository classes
**Angular:** `ApiService` (HttpClient) + feature-specific services combining API + state

---

## The ApiService — Direct Dio → HttpClient Port

```typescript
// src/app/data/services/api.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import {
  User, Course, CreateCourseDto, UpdateCourseDto,
  Consultation, CreateConsultationDto,
  Service, ServiceCategory,
  Article,
  Order, CreateOrderDto,
  Staff,
  GeneralInfo, LandingResponse,
  ConsultationAppointment, CreateAppointmentDto,
} from '../models';

@Injectable({ providedIn: 'root' })
export class ApiService {
  constructor(private http: HttpClient) {}

  // ── Auth ──────────────────────────────────────────────────────────
  login(email: string, password: string): Observable<User> {
    return this.http.post<User>('/api/auth/login', { email, password });
  }

  register(data: { email: string; password: string; firstName: string; lastName: string; phone?: string }): Observable<User> {
    return this.http.post<User>('/api/auth/register', data);
  }

  getProfile(): Observable<User> {
    return this.http.get<User>('/api/auth/me');
  }

  verifyEmail(token: string): Observable<void> {
    return this.http.post<void>(`/api/auth/verify/${token}`, {});
  }

  // ── General / Landing ─────────────────────────────────────────────
  getGeneralInfo(): Observable<GeneralInfo> {
    return this.http.get<GeneralInfo>('/api/general-info');
  }

  getLanding(): Observable<LandingResponse> {
    return this.http.get<LandingResponse>('/api/landing');
  }

  updateUnits(units: GeneralInfo['units']): Observable<void> {
    return this.http.put<void>('/api/general-info/units', { units });
  }

  updateSocialContacts(contacts: GeneralInfo['socialContacts']): Observable<void> {
    return this.http.put<void>('/api/general-info/social-contacts', { contacts });
  }

  // ── Courses ───────────────────────────────────────────────────────
  getCourses(): Observable<Course[]> {
    return this.http.get<Course[]>('/api/courses');
  }

  getMyCourses(): Observable<Course[]> {
    return this.http.get<Course[]>('/api/courses/me');
  }

  getCourseById(id: string): Observable<Course> {
    return this.http.get<Course>(`/api/courses/${id}`);
  }

  createCourse(data: CreateCourseDto): Observable<Course> {
    return this.http.post<Course>('/api/courses/create', data);
  }

  updateCourse(id: string, data: UpdateCourseDto): Observable<Course> {
    return this.http.put<Course>(`/api/courses/${id}`, data);
  }

  deleteCourse(id: string): Observable<void> {
    return this.http.delete<void>(`/api/courses/${id}`);
  }

  // ── Consultations ─────────────────────────────────────────────────
  getConsultations(): Observable<Consultation[]> {
    return this.http.get<Consultation[]>('/api/consultations');
  }

  getConsultationById(id: string): Observable<Consultation> {
    return this.http.get<Consultation>(`/api/consultations/${id}`);
  }

  createConsultation(data: CreateConsultationDto): Observable<Consultation> {
    return this.http.post<Consultation>('/api/consultations/create', data);
  }

  updateConsultation(id: string, data: Partial<CreateConsultationDto>): Observable<Consultation> {
    return this.http.put<Consultation>(`/api/consultations/${id}`, data);
  }

  deleteConsultation(id: string): Observable<void> {
    return this.http.delete<void>(`/api/consultations/${id}`);
  }

  // ── Consultation Appointments ─────────────────────────────────────
  createAppointment(data: CreateAppointmentDto): Observable<ConsultationAppointment> {
    return this.http.post<ConsultationAppointment>('/api/consultation-appointments', data);
  }

  getMyAppointments(): Observable<ConsultationAppointment[]> {
    return this.http.get<ConsultationAppointment[]>('/api/consultation-appointments/me');
  }

  // ── Services ──────────────────────────────────────────────────────
  getServices(categoryId?: string): Observable<Service[]> {
    const params = categoryId ? { categoryId } : {};
    return this.http.get<Service[]>('/api/services', { params });
  }

  getServiceById(id: string): Observable<Service> {
    return this.http.get<Service>(`/api/services/${id}`);
  }

  createService(data: Omit<Service, 'id' | 'createdAt' | 'updatedAt'>): Observable<Service> {
    return this.http.post<Service>('/api/services/create', data);
  }

  updateService(id: string, data: Partial<Service>): Observable<Service> {
    return this.http.put<Service>(`/api/services/${id}`, data);
  }

  deleteService(id: string): Observable<void> {
    return this.http.delete<void>(`/api/services/${id}`);
  }

  // ── Articles ──────────────────────────────────────────────────────
  getArticles(): Observable<Article[]> {
    return this.http.get<Article[]>('/api/articles');
  }

  getArticleById(id: string): Observable<Article> {
    return this.http.get<Article>(`/api/articles/${id}`);
  }

  createArticle(data: Omit<Article, 'id' | 'createdAt' | 'updatedAt'>): Observable<Article> {
    return this.http.post<Article>('/api/articles/create', data);
  }

  updateArticle(id: string, data: Partial<Article>): Observable<Article> {
    return this.http.put<Article>(`/api/articles/${id}`, data);
  }

  deleteArticle(id: string): Observable<void> {
    return this.http.delete<void>(`/api/articles/${id}`);
  }

  // ── Staff ─────────────────────────────────────────────────────────
  getStaff(): Observable<Staff[]> {
    return this.http.get<Staff[]>('/api/staff');
  }

  createStaff(data: Omit<Staff, 'id' | 'createdAt' | 'updatedAt'>): Observable<Staff> {
    return this.http.post<Staff>('/api/staff/create', data);
  }

  updateStaff(id: string, data: Partial<Staff>): Observable<Staff> {
    return this.http.put<Staff>(`/api/staff/${id}`, data);
  }

  deleteStaff(id: string): Observable<void> {
    return this.http.delete<void>(`/api/staff/${id}`);
  }

  // ── Orders ────────────────────────────────────────────────────────
  createOrder(data: CreateOrderDto): Observable<Order> {
    return this.http.post<Order>('/api/orders', data);
  }

  getMyOrders(): Observable<Order[]> {
    return this.http.get<Order[]>('/api/orders/me');
  }

  // ── Upload ────────────────────────────────────────────────────────
  uploadImage(file: File): Observable<{ url: string }> {
    const form = new FormData();
    form.append('file', file, file.name);
    return this.http.post<{ url: string }>('/api/upload/image', form);
  }

  uploadVideo(file: File): Observable<{ url: string }> {
    const form = new FormData();
    form.append('file', file, file.name);
    return this.http.post<{ url: string }>('/api/upload/video', form);
  }
}
```

---

## Error Handling — Shared Toast Service

Replace the Flutter `flash` package with Angular Material's Snackbar:

```typescript
// src/app/core/services/toast.service.ts
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';

@Injectable({ providedIn: 'root' })
export class ToastService {
  constructor(private snackBar: MatSnackBar) {}

  success(message: string): void {
    this.snackBar.open(message, 'Close', {
      duration: 3000,
      panelClass: ['toast-success'],
    });
  }

  error(message: string): void {
    this.snackBar.open(message, 'Close', {
      duration: 5000,
      panelClass: ['toast-error'],
    });
  }
}
```

```scss
// styles.scss — global toast styles
.toast-success .mdc-snackbar__surface { background: #4caf50; }
.toast-error .mdc-snackbar__surface { background: #f44336; }
```

---

## Repository Pattern — BaseRepository → catchError

Your Flutter `BaseRepository` wraps API calls in try/catch and returns `Either<Failure, T>`. In Angular, replicate this with RxJS `catchError`:

```typescript
// src/app/data/services/course.service.ts
import { catchError, of } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class CourseService {
  private coursesSubject = new BehaviorSubject<Course[]>([]);
  private loadingSubject = new BehaviorSubject(false);
  private errorSubject = new BehaviorSubject<string | null>(null);

  courses$ = this.coursesSubject.asObservable();
  loading$ = this.loadingSubject.asObservable();
  error$ = this.errorSubject.asObservable();

  constructor(private api: ApiService) {}

  loadCourses(): void {
    this.loadingSubject.next(true);
    this.errorSubject.next(null);

    this.api.getCourses().pipe(
      catchError(err => {
        this.errorSubject.next(this.parseError(err));
        return of([]);
      })
    ).subscribe(courses => {
      this.coursesSubject.next(courses);
      this.loadingSubject.next(false);
    });
  }

  private parseError(err: HttpErrorResponse): string {
    if (err.status === 0) return 'No internet connection';
    if (err.status === 401) return 'Unauthorized — please log in';
    if (err.status === 403) return 'You do not have permission';
    if (err.status === 404) return 'Not found';
    if (err.status >= 500) return 'Server error — please try again later';
    return err.message || 'Unknown error';
  }
}
```

---

## Further Reading

- [Angular HttpClient Making Requests](https://angular.dev/guide/http/making-requests)
- [Error handling](https://angular.dev/guide/http/making-requests#handling-request-failure)
- [RxJS catchError](https://rxjs.dev/api/operators/catchError)

---

> **Prev:** [03 — Data Models](03_models.md) | **Next:** [05 — Auth Module](05_auth.md)
