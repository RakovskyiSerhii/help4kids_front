# Lesson 06 — Generics

Generics in TypeScript work the same as in Dart. The syntax is identical: `<T>`.

---

## Generic functions

```typescript
// Dart:   T first<T>(List<T> items) => items.first;
// TypeScript:
function first<T>(items: T[]): T | undefined {
  return items[0];
}

const n: number | undefined = first([1, 2, 3]);
const s: string | undefined = first(['a', 'b']);
```

---

## Generic interfaces

```typescript
interface ApiResponse<T> {
  data: T;
  status: number;
  message: string;
}

// Usage
const courseResponse: ApiResponse<Course[]> = await fetchCourses();
```

| Dart | TypeScript |
|------|------------|
| `class Response<T>` | `interface Response<T>` or `class Response<T>` |
| `T data` | `data: T` |
| `Future<T>` | `Promise<T>` |
| `List<T>` | `T[]` or `Array<T>` |

---

## Generic constraints

Use `extends` to limit what types are allowed:

```typescript
// T must have an `id` field — otherwise TypeScript can't access `item.id`
function findById<T extends { id: string }>(items: T[], id: string): T | undefined {
  return items.find(item => item.id === id);
}
```

Without the constraint, TypeScript would refuse `item.id` because it doesn't know that `T` has `id`.

---

## `keyof` operator

`keyof T` is the union of all keys of `T`:

```typescript
interface User { id: string; name: string; age: number; }
type UserKey = keyof User;  // 'id' | 'name' | 'age'

// Generic function that accesses a known key of T
function getField<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const name = getField(user, 'name');  // string — TypeScript knows the return type
```

---

## Generic classes

```typescript
class Stack<T> {
  private items: T[] = [];

  push(item: T): void { this.items.push(item); }
  pop(): T | undefined { return this.items.pop(); }
  peek(): T | undefined { return this.items[this.items.length - 1]; }
  isEmpty(): boolean { return this.items.length === 0; }
}

const stack = new Stack<number>();
stack.push(1);
stack.push(2);
```

---

## Tasks

- `task01.ts` — generic functions
- `task02.ts` — generic interfaces and `keyof`
- `task03.ts` — generic class
