# Lesson 07 — Utility Types

TypeScript ships with built-in generic types that transform existing types. They eliminate the need to manually rewrite interfaces for every use case. Think of them as Dart extension methods on types themselves.

---

## The core utility types

Given a base type:

```typescript
interface Course {
  id: string;
  title: string;
  price: number;
  contentUrl: string;
  published: boolean;
}
```

### `Partial<T>` — make all fields optional

```typescript
type UpdateCourseDto = Partial<Course>;
// { id?: string; title?: string; price?: number; ... }
// Used for PATCH endpoints — you only send the fields you want to change
```

### `Required<T>` — make all fields required (opposite of Partial)

```typescript
type FullCourse = Required<Course>;
// All fields guaranteed to be present
```

### `Readonly<T>` — make all fields readonly

```typescript
type FrozenCourse = Readonly<Course>;
// Cannot reassign any field after creation
```

### `Pick<T, K>` — keep only specified fields

```typescript
type CourseCard = Pick<Course, 'id' | 'title' | 'price'>;
// { id: string; title: string; price: number; }
```

### `Omit<T, K>` — exclude specified fields

```typescript
type CreateCourseDto = Omit<Course, 'id'>;
// { title: string; price: number; contentUrl: string; published: boolean; }
// Used for POST endpoints — server generates id, you don't send it
```

### `Record<K, V>` — map type

```typescript
// Dart: Map<String, int>
type ScoreMap = Record<string, number>;
const scores: ScoreMap = { alice: 95, bob: 82 };
```

### `ReturnType<T>` and `Parameters<T>`

```typescript
function fetchUser(id: string, token: string): Promise<User> { ... }

type FetchUserReturn = ReturnType<typeof fetchUser>;   // Promise<User>
type FetchUserParams = Parameters<typeof fetchUser>;   // [string, string]
```

| Dart | TypeScript |
|------|------------|
| Copy constructor with optional fields | `Partial<T>` |
| No equivalent | `Pick<T, K>` |
| No equivalent | `Omit<T, K>` |
| `Map<K, V>` | `Record<K, V>` |
| No equivalent | `ReturnType<typeof fn>` |

---

## Combining utility types

```typescript
// A type for updating a course — title and price only, both optional
type PatchCourseDto = Partial<Pick<Course, 'title' | 'price'>>;
```

---

## Tasks

- `task01.ts` — Partial, Required, Readonly
- `task02.ts` — Pick, Omit, Record
- `task03.ts` — ReturnType, Parameters, and combining utilities
