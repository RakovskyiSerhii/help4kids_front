# Lesson 10 — Async / Await

`Promise<T>` is TypeScript's `Future<T>`. The `async/await` syntax is identical to Dart's. The differences are in how errors are typed and how concurrent operations are written.

---

## Basic async function

```typescript
// Dart:   Future<User> fetchUser(String id) async { ... }
// TypeScript:
async function fetchUser(id: string): Promise<User> {
  const response = await fetch(`/api/users/${id}`);
  return response.json() as Promise<User>;
}
```

An `async` function always returns `Promise<T>`. Even if you write `return 'hello'`, the actual return type is `Promise<string>`.

---

## Error handling

In TypeScript, a caught error has type `unknown`, not `Error`. You must narrow it:

```typescript
// Dart:   on Exception catch (e)
// TypeScript:
try {
  const user = await fetchUser('123');
} catch (err: unknown) {     // always type as unknown
  if (err instanceof Error) {
    console.error(err.message);
  }
}
```

**Never** use `catch (err: any)` — it disables type checking on the error.

---

## Promise.all — concurrent operations

```typescript
// Dart:   await Future.wait([fetchUser(), fetchCourses()])
// TypeScript:
const [user, courses] = await Promise.all([
  fetchUser(id),
  fetchCourses(),
]);
// user: User, courses: Course[] — types inferred correctly
```

| Dart | TypeScript |
|------|------------|
| `Future<T>` | `Promise<T>` |
| `async` | `async` |
| `await` | `await` |
| `Future.wait([...])` | `Promise.all([...])` |
| `Future.error(...)` | `Promise.reject(...)` |
| `on Exception catch (e)` | `catch (e: unknown) { if (e instanceof Error) ... }` |

---

## Async in classes

```typescript
class UserService {
  async getUser(id: string): Promise<User | null> {
    try {
      const res = await fetch(`/api/users/${id}`);
      if (!res.ok) return null;
      return res.json() as Promise<User>;
    } catch {
      return null;
    }
  }
}
```

---

## Tasks

- `task01.ts` — Promise typing and async functions
- `task02.ts` — error handling in async
- `task03.ts` — Promise.all and async class methods
