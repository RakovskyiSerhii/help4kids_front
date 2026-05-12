# Part 2 — 03: Data Models in TypeScript

> **Prev:** [02 — Environments](02_environments.md) | **Next:** [04 — API Service](04_api_service.md)

**Flutter:** Freezed sealed classes with generated `fromJson`/`copyWith`/`==`
**Angular:** TypeScript interfaces (zero runtime cost, no code generation needed)

---

## The Key Difference

Freezed gives you immutability, equality, serialization, and copyWith — all generated. TypeScript interfaces give you only the type shape at compile time. At runtime they vanish. This means:

- No `copyWith` — use spread operator: `{ ...course, title: 'new' }`
- No generated `fromJson` — JSON is already the right shape from the API
- No value equality — use `===` on IDs, not object references
- Mutability is default — be intentional, use `readonly` or `Readonly<T>` when you need it

---

## All Project Models

```typescript
// src/app/data/models/user.model.ts
export interface User {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  roleId: string;
  createdAt: string;
  updatedAt: string;
  createdBy?: string;
  updatedBy?: string;
}

export function isAdmin(user: User): boolean {
  return user.roleId === 'admin';
}

export function fullName(user: User): string {
  return `${user.firstName} ${user.lastName}`;
}
```

```typescript
// src/app/data/models/course.model.ts
export interface Course {
  id: string;
  title: string;
  shortDescription: string;
  longDescription?: string;
  image?: string;
  icon: string;
  price: number;
  duration?: number;
  contentUrl: string;
  featured: boolean;
  createdAt: string;
  updatedAt: string;
  createdBy?: string;
  updatedBy?: string;
}

// DTO for create/update — id and timestamps managed by backend
export type CreateCourseDto = Omit<Course, 'id' | 'createdAt' | 'updatedAt' | 'createdBy' | 'updatedBy'>;
export type UpdateCourseDto = Partial<CreateCourseDto>;
```

```typescript
// src/app/data/models/consultation.model.ts
export interface Consultation {
  id: string;
  title: string;
  shortDescription: string;
  longDescription?: string;
  image?: string;
  icon: string;
  price: number;
  duration?: number;
  featured: boolean;
  createdAt: string;
  updatedAt: string;
}

export type CreateConsultationDto = Omit<Consultation, 'id' | 'createdAt' | 'updatedAt'>;
```

```typescript
// src/app/data/models/service.model.ts
export interface Service {
  id: string;
  categoryId: string;
  title: string;
  shortDescription: string;
  longDescription?: string;
  image?: string;
  icon: string;
  price: Record<string, number> | number;  // flexible — matches Flutter's Map<String, dynamic>
  duration?: number;
  featured: boolean;
  bookingId?: string;
  createdAt: string;
  updatedAt: string;
}

export interface ServiceCategory {
  id: string;
  name: string;
  icon: string;
}
```

```typescript
// src/app/data/models/article.model.ts
export interface Article {
  id: string;
  categoryId: string;
  title: string;
  content: string;     // HTML content — sanitize before rendering
  image?: string;
  createdAt: string;
  updatedAt: string;
}

export interface ArticleCategory {
  id: string;
  name: string;
}
```

```typescript
// src/app/data/models/order.model.ts
export type OrderStatus = 'pending' | 'paid' | 'failed';  // = Dart sealed class

export interface Order {
  id: string;
  userId: string;
  serviceType: 'course' | 'consultation' | 'service';
  serviceId: string;
  amount: number;
  status: OrderStatus;
  paymentUrl?: string;   // redirect URL from payment provider
  createdAt: string;
  updatedAt: string;
}

export interface CreateOrderDto {
  serviceType: Order['serviceType'];
  serviceId: string;
  amount: number;
}
```

```typescript
// src/app/data/models/staff.model.ts
export interface Staff {
  id: string;
  name: string;
  title: string;
  bio?: string;
  photo?: string;
  createdAt: string;
  updatedAt: string;
}
```

```typescript
// src/app/data/models/general-info.model.ts
export interface Unit {
  label: string;
  value: string;
}

export interface SocialContact {
  platform: string;
  url: string;
  icon?: string;
}

export interface GeneralInfo {
  units: Unit[];
  socialContacts: SocialContact[];
  categories: ServiceCategory[];
}

export interface LandingResponse {
  generalInfo: GeneralInfo;
  featuredCourses: Course[];
  featuredConsultations: Consultation[];
  staff: Staff[];
}
```

```typescript
// src/app/data/models/consultation-appointment.model.ts
export type AppointmentStatus = 'pending' | 'confirmed' | 'cancelled';

export interface ConsultationAppointment {
  id: string;
  userId: string;
  consultationId: string;
  scheduledAt: string;   // ISO datetime
  status: AppointmentStatus;
  notes?: string;
  createdAt: string;
}

export interface CreateAppointmentDto {
  consultationId: string;
  scheduledAt: string;
  notes?: string;
}
```

---

## Barrel Export (index.ts)

Create a single entry point for all models — like Dart's `part` files or a package barrel:

```typescript
// src/app/data/models/index.ts
export * from './user.model';
export * from './course.model';
export * from './consultation.model';
export * from './service.model';
export * from './article.model';
export * from './order.model';
export * from './staff.model';
export * from './general-info.model';
export * from './consultation-appointment.model';
```

```typescript
// Now import from one place
import { User, Course, Order, CreateOrderDto } from '../data/models';
```

---

## copyWith Pattern (Dart) → Spread Operator (TypeScript)

```dart
// Dart
final updated = course.copyWith(title: 'New Title', featured: true);
```

```typescript
// TypeScript — spread to create a modified copy
const updated: Course = { ...course, title: 'New Title', featured: true };

// Partial update helper (optional utility)
function patch<T>(obj: T, partial: Partial<T>): T {
  return { ...obj, ...partial };
}

const updated = patch(course, { title: 'New Title' });
```

---

## Further Reading

- [TypeScript Interfaces](https://www.typescriptlang.org/docs/handbook/2/objects.html)
- [Utility Types (Omit, Partial, Pick)](https://www.typescriptlang.org/docs/handbook/utility-types.html)
- [Union Types](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#union-types)

---

> **Prev:** [02 — Environments](02_environments.md) | **Next:** [04 — API Service](04_api_service.md)
