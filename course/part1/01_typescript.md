# 01 — TypeScript for Dart Developers

> **Next:** [02 — Angular Architecture](02_architecture.md)

TypeScript is JavaScript with types. Coming from Dart you will feel at home immediately — both languages share the same heritage (Java/C# influence) and have nearly identical null-safety syntax. The main difference is that TypeScript compiles to JavaScript and runs in a browser without a VM.

---

## Basic Types

```typescript
// Primitives
const name: string = 'Serhii';
const age: number = 30;         // no int/double split — everything is number
const active: boolean = true;

// Arrays
const scores: number[] = [1, 2, 3];
const names: Array<string> = ['a', 'b'];  // generic form

// Tuple — fixed-length, typed array
const pair: [string, number] = ['age', 30];

// Any — avoid it, it disables type checking
const unsafe: any = 'could be anything';

// Unknown — safer than any, must check before using
const val: unknown = fetchSomething();
if (typeof val === 'string') console.log(val.toUpperCase());

// Never — a function that never returns (throws or infinite loops)
function fail(msg: string): never {
  throw new Error(msg);
}
```

**Dart comparison:**

| Dart | TypeScript |
|------|------------|
| `int` | `number` |
| `double` | `number` |
| `String` | `string` |
| `bool` | `boolean` |
| `List<T>` | `T[]` or `Array<T>` |
| `Map<K,V>` | `Record<K,V>` or `{ [key: string]: V }` |
| `dynamic` | `any` (avoid) |
| `Object` | `object` |
| `void` | `void` |

---

## Null Safety

TypeScript null safety works identically to Dart:

```typescript
// By default (with strict mode) — same as Dart sound null safety
let name: string = 'Serhii';   // can NOT be null
let nick: string | null = null; // CAN be null — must handle it
let bio: string | undefined;    // optional — same as Dart's ?

// Optional chaining — same syntax as Dart
const len = user?.profile?.bio?.length;

// Null coalescing — same syntax as Dart
const display = user?.name ?? 'Anonymous';

// Non-null assertion (use sparingly)
const el = document.getElementById('app')!;  // ! = as in Dart's ! operator
```

Always enable strict mode in `tsconfig.json` — it gives you the same safety guarantees as Dart's sound null safety.

---

## Interfaces

In Dart you use `@freezed` for immutable data classes. In TypeScript the equivalent is `interface` (structure only, no runtime cost):

```typescript
// TypeScript interface — like a Dart abstract class or Freezed model
interface User {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  roleId: string;
  createdAt: string;    // ISO date string from JSON
  updatedAt: string;
  createdBy?: string;   // ? = optional, like Dart's String?
}

// Extending interfaces — like Dart class extending another
interface AdminUser extends User {
  permissions: string[];
}
```

**Type alias** — often interchangeable with interface for objects:

```typescript
type OrderStatus = 'pending' | 'paid' | 'failed';  // union type = Dart sealed/enum

type Course = {
  id: string;
  title: string;
  price: number;
  featured: boolean;
};
```

Use `interface` for objects/shapes, `type` for unions and aliases.

---

## Classes

```typescript
class CourseService {
  private readonly baseUrl: string;

  constructor(
    private http: HttpClient,   // shorthand — creates and assigns field
    baseUrl: string,
  ) {
    this.baseUrl = baseUrl;
  }

  async getCourses(): Promise<Course[]> {
    const response = await fetch(`${this.baseUrl}/api/courses`);
    return response.json();
  }
}
```

**Access modifiers:** `private`, `protected`, `public` (default is public — opposite of Dart's `_` prefix convention).

---

## Generics

```typescript
// Generic function
function first<T>(items: T[]): T | undefined {
  return items[0];
}

// Generic interface
interface ApiResponse<T> {
  data: T;
  status: number;
  message: string;
}

// Usage
const response: ApiResponse<Course[]> = await fetchCourses();
```

---

## Utility Types

TypeScript ships with built-in generic types that are very useful when building API DTOs. Think of them as Dart extension methods on types:

```typescript
interface Course {
  id: string;
  title: string;
  price: number;
  contentUrl: string;
}

// Partial<T> — all fields optional (useful for update DTOs)
type UpdateCourseDto = Partial<Course>;
// { id?: string; title?: string; price?: number; contentUrl?: string; }

// Required<T> — all fields required (opposite of Partial)
type FullCourse = Required<Course>;

// Pick<T, K> — pick only some fields
type CourseCard = Pick<Course, 'id' | 'title' | 'price'>;

// Omit<T, K> — exclude some fields (useful for create DTOs — omit id)
type CreateCourseDto = Omit<Course, 'id'>;

// Record<K, V> — map type
type IconMap = Record<string, string>;  // like Dart's Map<String, String>

// Readonly<T> — immutable (like Dart's final everywhere)
type ImmutableCourse = Readonly<Course>;
```

---

## Enums and Union Types

```typescript
// TypeScript enum (similar to Dart enum)
enum UserRole {
  Admin = 'admin',
  User = 'user',
}

// String union (preferred over enum in most cases — simpler)
type OrderStatus = 'pending' | 'paid' | 'failed';

function getStatusLabel(status: OrderStatus): string {
  switch (status) {
    case 'pending': return 'In progress';
    case 'paid': return 'Paid';
    case 'failed': return 'Failed';
  }
}
```

---

## Decorators

TypeScript decorators = Dart annotations. Angular uses them everywhere:

```typescript
// Dart
@singleton
class MyService {}

@Component(selector: 'home')
class HomeWidget {}

// TypeScript/Angular
@Injectable({ providedIn: 'root' })
class MyService {}

@Component({ selector: 'app-home', template: '<h1>Home</h1>' })
class HomeComponent {}
```

Decorators are functions that receive metadata about the class. Angular reads them at compile time.

---

## async/await

Works identically to Dart. `Promise<T>` = `Future<T>`:

```typescript
// Same pattern as Dart
async function loadUser(id: string): Promise<User> {
  try {
    const res = await fetch(`/api/users/${id}`);
    if (!res.ok) throw new Error('Failed');
    return res.json() as Promise<User>;
  } catch (err) {
    console.error(err);
    throw err;
  }
}
```

---

## Modules (import/export)

```typescript
// Dart
import 'package:help4kids/data/model/course.dart';

// TypeScript
import { Course } from './models/course.model';
import { Injectable } from '@angular/core';
import type { User } from './user.model';  // type-only import (no runtime cost)
```

```typescript
// Exporting
export interface Course { ... }         // named export
export default class AppComponent {}   // default export (avoid in Angular)
export { CourseService, CourseState };  // re-export multiple
```

---

## Key Differences to Remember

1. **No runtime type checking** — TypeScript types exist only at compile time; at runtime it's plain JavaScript.
2. **`number` covers both int and double** — there is no integer type.
3. **`undefined` vs `null`** — both exist; `undefined` means "not set", `null` means "intentionally empty".
4. **Structural typing** — if an object has the right shape it satisfies an interface, even without `implements`.
5. **`console.log()` not `print()`**
6. **No `const` constructor** — objects are mutable by default (use `Readonly<T>` or `Object.freeze()` if needed).

---

## Further Reading

- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html) — official, comprehensive
- [TypeScript for Java/C# Programmers](https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes-oop.html) — also relevant for Dart devs
- [TypeScript Utility Types](https://www.typescriptlang.org/docs/handbook/utility-types.html) — full list of built-in generics
- [TypeScript Playground](https://www.typescriptlang.org/play) — run TypeScript in browser, great for experimenting

---

> **Next:** [02 — Angular Architecture](02_architecture.md)
