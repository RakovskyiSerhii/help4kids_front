# Lesson 09 — Advanced Types

Mapped types, conditional types, and template literal types. These are TypeScript-only features — Dart has no equivalent. They let you derive new types from existing ones at the type level.

---

## Mapped Types

Transform every property of an existing type:

```typescript
// Make every field optional (this is how Partial<T> is implemented)
type MyPartial<T> = {
  [K in keyof T]?: T[K];
};

// Make every field nullable
type Nullable<T> = {
  [K in keyof T]: T[K] | null;
};

// Make every field readonly
type MyReadonly<T> = {
  readonly [K in keyof T]: T[K];
};
```

The syntax `[K in keyof T]` means "for each key K of T". It's a loop over type keys.

---

## Conditional Types

Types that depend on a condition — like a ternary at the type level:

```typescript
// T extends U ? X : Y
type IsString<T> = T extends string ? true : false;

type A = IsString<string>;   // true
type B = IsString<number>;   // false
```

### `infer` — extract a type from a structure

```typescript
// Extract the element type from an array
type ElementOf<T> = T extends Array<infer E> ? E : never;

type N = ElementOf<number[]>;    // number
type S = ElementOf<string[]>;    // string
type X = ElementOf<boolean>;     // never — not an array
```

`infer E` says "if T is an array, call its element type E and give it to me."

---

## Template Literal Types

Build string literal types from other literals:

```typescript
type Direction = 'top' | 'bottom' | 'left' | 'right';

// CSS property names
type MarginProp = `margin-${Direction}`;
// 'margin-top' | 'margin-bottom' | 'margin-left' | 'margin-right'

// Event name pattern
type EventName<T extends string> = `on${Capitalize<T>}`;
type ClickEvent = EventName<'click'>;  // 'onClick'
```

---

## Intersection types

Combine multiple types into one (all fields required):

```typescript
type A = { id: string; name: string };
type B = { email: string; role: string };
type C = A & B;
// { id: string; name: string; email: string; role: string }
```

Use intersection to compose interfaces (when you control neither individually).

---

## Tasks

- `task01.ts` — write your own mapped types
- `task02.ts` — conditional types and `infer`
- `task03.ts` — template literal types and intersection types
