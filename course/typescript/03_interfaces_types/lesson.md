# Lesson 03 — Interfaces & Type Aliases

TypeScript has two ways to define shapes: `interface` and `type`. They look similar but have different purposes.

---

## Interface

An interface defines the shape of an object. It has no runtime representation — it is erased at compile time.

```typescript
interface User {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  createdAt: string;
  role?: string;        // optional field
  readonly token: string;  // cannot be reassigned after creation
}
```

| Dart | TypeScript |
|------|------------|
| `abstract class User` | `interface User` |
| `class User with Serializable` | `class User implements User` |
| `String? name` | `name?: string` (optional field) |
| `final String id` | `readonly id: string` |

---

## Extending interfaces

```typescript
interface Entity {
  id: string;
  createdAt: string;
}

interface User extends Entity {
  email: string;
  name: string;
}

// User now has: id, createdAt, email, name
```

Dart equivalent: `abstract class User extends Entity`

---

## Type alias

`type` is used for:
- Union types (value can be one of several types)
- Intersection types
- Aliases for primitives or complex types
- Named tuples

```typescript
// Union — value must be one of these exact strings
type Status = 'pending' | 'active' | 'banned';

// Union of objects
type Result<T> = { ok: true; data: T } | { ok: false; error: string };

// Alias for a complex type
type UserId = string;

// Alias for a function signature
type Handler = (event: Event) => void;
```

| Dart | TypeScript |
|------|------------|
| `enum Status { pending, active }` | `type Status = 'pending' \| 'active'` (string union) |
| `sealed class Result` | `type Result<T> = Success<T> \| Failure` |
| `typedef Handler = void Function(Event)` | `type Handler = (e: Event) => void` |

---

## interface vs type — rule of thumb

| Use `interface` for… | Use `type` for… |
|----------------------|-----------------|
| Object shapes | Union types |
| Classes to implement | Intersection types |
| Extending / merging | Function signatures |
| API models | Primitive aliases |

When in doubt on an object shape: prefer `interface`. It has better error messages and supports declaration merging.

---

## Tasks

- `task01.ts` — define interfaces with optional and readonly fields
- `task02.ts` — interface extension and implementing in a class
- `task03.ts` — type aliases for unions and function signatures
