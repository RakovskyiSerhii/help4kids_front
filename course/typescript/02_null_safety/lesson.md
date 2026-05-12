# Lesson 02 — Null Safety

With `strict: true` in tsconfig, TypeScript's null safety behaves identically to Dart's sound null safety. This should feel natural.

---

## Nullable types

```typescript
// Non-nullable — cannot be null or undefined
let name: string = 'Serhii';
// name = null;  // ERROR — same as Dart

// Nullable — must be handled before use
let nick: string | null = null;

// Optional — may be undefined (not set yet)
let bio: string | undefined;
```

| Dart | TypeScript |
|------|------------|
| `String name` | `name: string` |
| `String? name` | `name: string \| null` or `name: string \| undefined` |
| `late String name` | no equivalent (use non-null assertion sparingly) |

> **`null` vs `undefined`:** In TypeScript both exist. `null` = intentionally empty. `undefined` = not assigned / missing. Use `null` for intentional absence; `undefined` for optional fields.

---

## Optional chaining `?.`

Identical to Dart:

```typescript
const user: User | null = getUser();

// Dart: user?.profile?.bio?.length
// TypeScript: same syntax
const len: number | undefined = user?.profile?.bio?.length;
```

---

## Nullish coalescing `??`

Identical to Dart:

```typescript
const display: string = user?.name ?? 'Anonymous';
```

> Use `??` not `||`. The `||` operator treats `0`, `''`, and `false` as falsy — it returns the right side even when the left side is a valid value. `??` only triggers on `null` or `undefined`.

```typescript
const count = 0;
console.log(count || 10);   // 10  ← wrong, 0 is a valid count
console.log(count ?? 10);   // 0   ← correct
```

---

## Non-null assertion `!`

Same as Dart's `!` postfix. Use it only when you are certain the value cannot be null and the compiler cannot prove it:

```typescript
const el = document.getElementById('app')!;  // you know it exists
```

Overusing `!` defeats null safety. Use it sparingly.

---

## Optional parameters in functions

```typescript
// Dart: String greet(String name, [String? title])
// TypeScript:
function greet(name: string, title?: string): string {
  return title ? `${title} ${name}` : name;
}
```

The `?` after the parameter name makes it `string | undefined` — same as `String?` in Dart.

---

## Tasks

- `task01.ts` — nullable types and basic checks
- `task02.ts` — optional chaining and nullish coalescing
- `task03.ts` — practical: safe access deep into nested objects
