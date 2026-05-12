# 08 — HttpClient

> **Prev:** [07 — Router](07_router.md) | **Next:** [09 — RxJS](09_rxjs.md)

`HttpClient` is Angular's built-in HTTP library — the equivalent of Dio. Like Dio, it supports interceptors, typed responses, and error handling. Unlike Dio, it returns **Observables** instead of Futures.

---

## Setup

```typescript
// app.config.ts
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { authInterceptor } from './core/interceptors/auth.interceptor';

export const appConfig: ApplicationConfig = {
  providers: [
    provideHttpClient(
      withInterceptors([authInterceptor]),
    ),
  ],
};
```

---

## Basic HTTP Methods

```typescript
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class ApiService {
  constructor(private http: HttpClient) {}

  // GET — returns Observable<T>, not Promise<T>
  getCourses(): Observable<Course[]> {
    return this.http.get<Course[]>('/api/courses');
  }

  getCourseById(id: string): Observable<Course> {
    return this.http.get<Course>(`/api/courses/${id}`);
  }

  // POST
  createOrder(body: CreateOrderDto): Observable<Order> {
    return this.http.post<Order>('/api/orders', body);
  }

  // PUT
  updateCourse(id: string, body: Partial<Course>): Observable<Course> {
    return this.http.put<Course>(`/api/courses/${id}`, body);
  }

  // DELETE
  deleteCourse(id: string): Observable<void> {
    return this.http.delete<void>(`/api/courses/${id}`);
  }

  // GET with query parameters
  getServices(categoryId?: string): Observable<Service[]> {
    const params: Record<string, string> = {};
    if (categoryId) params['categoryId'] = categoryId;
    return this.http.get<Service[]>('/api/services', { params });
  }
}
```

---

## Observables are Lazy

**Critical difference from Dio:** `http.get()` does NOT fire until someone subscribes. This is like a Dart `Stream` — nothing happens until you `listen()`:

```typescript
const obs = this.http.get<Course[]>('/api/courses');
// HTTP request has NOT been sent yet

obs.subscribe(courses => console.log(courses));
// NOW the request fires
```

The `async` pipe in templates handles this automatically. When you write `courses$ | async`, Angular subscribes and unsubscribes for you.

---

## HttpInterceptors — Like Dio Interceptors

Interceptors run for every request/response. Use them for: adding auth tokens, logging, error handling, adding base URLs.

```typescript
// auth.interceptor.ts
import { HttpInterceptorFn, HttpRequest, HttpHandlerFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { catchError, throwError } from 'rxjs';
import { AuthService } from '../services/auth.service';

export const authInterceptor: HttpInterceptorFn = (req: HttpRequest<unknown>, next: HttpHandlerFn) => {
  const auth = inject(AuthService);
  const token = auth.getToken();

  // Clone request and add header (requests are immutable — like Dio's RequestOptions)
  const authReq = token
    ? req.clone({ headers: req.headers.set('Authorization', `Bearer ${token}`) })
    : req;

  return next(authReq).pipe(
    catchError(err => {
      if (err.status === 401) {
        auth.logout();
      }
      return throwError(() => err);
    })
  );
};
```

```typescript
// base-url.interceptor.ts — add base URL to all requests (like Dio baseUrl option)
export const baseUrlInterceptor: HttpInterceptorFn = (req, next) => {
  const env = inject(ENVIRONMENT);
  const apiReq = req.clone({ url: `${env.apiUrl}${req.url}` });
  return next(apiReq);
};
```

```typescript
// logging.interceptor.ts
export const loggingInterceptor: HttpInterceptorFn = (req, next) => {
  console.log(`→ ${req.method} ${req.url}`);
  const start = Date.now();

  return next(req).pipe(
    tap(() => console.log(`← ${req.url} (${Date.now() - start}ms)`)),
    catchError(err => {
      console.error(`✗ ${req.url}`, err.status, err.message);
      return throwError(() => err);
    })
  );
};
```

Register multiple interceptors — they run in order:
```typescript
provideHttpClient(
  withInterceptors([baseUrlInterceptor, authInterceptor, loggingInterceptor])
)
```

---

## Error Handling

```typescript
import { HttpErrorResponse } from '@angular/common/http';
import { catchError, throwError, EMPTY } from 'rxjs';

getCourses(): Observable<Course[]> {
  return this.http.get<Course[]>('/api/courses').pipe(
    catchError((err: HttpErrorResponse) => {
      if (err.status === 404) return of([]);          // return empty array
      if (err.status === 401) { this.auth.logout(); return EMPTY; }
      if (err.status >= 500) {
        this.toast.error('Server error. Please try again.');
        return EMPTY;
      }
      return throwError(() => new Error(err.message)); // rethrow for component
    })
  );
}
```

`HttpErrorResponse` fields:
- `status` — HTTP status code (401, 403, 404, 500…)
- `message` — error message
- `error` — parsed response body
- `url` — the URL that failed

---

## Reading Response Headers and Full Response

```typescript
// Get full response including headers (default is response body only)
this.http.get<Course>('/api/courses/1', { observe: 'response' }).subscribe(res => {
  console.log(res.status);          // 200
  console.log(res.headers.get('X-Total-Count'));
  console.log(res.body);            // Course
});
```

---

## File Upload (for admin content)

```typescript
uploadImage(file: File): Observable<{ url: string }> {
  const formData = new FormData();
  formData.append('file', file, file.name);

  return this.http.post<{ url: string }>('/api/upload/image', formData, {
    reportProgress: true,
    observe: 'events',
  }).pipe(
    filter(event => event.type === HttpEventType.Response),
    map(event => (event as HttpResponse<{ url: string }>).body!)
  );
}
```

---

## Comparison: Dio vs HttpClient

| Dio | HttpClient |
|---|---|
| `dio.get<T>('/path')` | `http.get<T>('/path')` |
| `dio.post('/path', data: body)` | `http.post<T>('/path', body)` |
| Returns `Future<Response<T>>` | Returns `Observable<T>` |
| `dio.interceptors.add(...)` | `withInterceptors([...])` |
| `DioException.response?.statusCode` | `HttpErrorResponse.status` |
| `BaseOptions.baseUrl` | Base URL interceptor |
| `FormData` | `FormData` (same Web API) |
| `onSendProgress` | `reportProgress: true` + `observe: 'events'` |

---

## Further Reading

- [Angular HttpClient Guide](https://angular.dev/guide/http) — official, covers all features
- [HTTP Interceptors](https://angular.dev/guide/http/interceptors) — functional interceptors in depth
- [Error Handling](https://angular.dev/guide/http/making-requests#handling-request-failure) — handling errors
- [File Upload with Progress](https://angular.dev/guide/http/making-requests#tracking-progress) — upload progress events

---

> **Prev:** [07 — Router](07_router.md) | **Next:** [09 — RxJS](09_rxjs.md)
