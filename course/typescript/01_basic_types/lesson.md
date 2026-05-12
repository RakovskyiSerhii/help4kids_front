# Lesson 01 — Basic Types

TypeScript = JavaScript + compile-time types. At runtime, all types are erased — it's plain JS.
Types are annotations, not runtime checks. Keep that in mind.

---

## Primitives

```typescript
const name: string = 'Serhii';
const age: number = 30;        // no int / double split — one type for all numbers
const active: boolean = true;
```

| Dart | TypeScript | Note |
|------|------------|------|
| `String` | `string` | lowercase in TS |
| `int` | `number` | |
| `double` | `number` | same type as int |
| `bool` | `boolean` | |
| `void` | `void` | |
| `dynamic` | `any` | avoid — disables type checking |
| `Object` | `object` | |

---

## Arrays and Tuples

```typescript
// Array — two equivalent syntaxes
const scores: number[] = [1, 2, 3];
const names: Array<string> = ['a', 'b'];

// Tuple — fixed length, each position has its own type
// Dart has no direct equivalent; closest is a record (Dart 3+)
const pair: [string, number] = ['age', 30];
const triple: [string, number, boolean] = ['admin', 1, true];
```

Tuples are not the same as `(string | number)[]`. A tuple has exactly N elements with exact types at each position.

---

## The special types: `any`, `unknown`, `never`

```typescript
// any — opts out of type checking entirely. AVOID.
const bad: any = 'whatever';
bad.foo.bar.baz;  // no error — TS gave up

// unknown — you must check the type before using the value
const val: unknown = fetchSomething();
// val.toUpperCase();  // ERROR — must narrow first
if (typeof val === 'string') {
  val.toUpperCase();  // OK — TS knows it's a string here
}

// never — a value that can never exist (function that always throws, infinite loop)
function fail(message: string): never {
  throw new Error(message);
}
// A function returning void can return undefined. never cannot return at all.
```

| Dart | TypeScript |
|------|------------|
| `dynamic` | `any` (avoid) |
| No equivalent | `unknown` (safe alternative to `any`) |
| No equivalent | `never` (unreachable code / exhaustiveness) |

---

## Type inference

TypeScript infers types from initializers. You don't always need annotations, but for this course — always annotate. It builds the habit.

```typescript
const x = 5;           // inferred as number — OK in practice
const y: number = 5;   // explicit — required in this course
```

---

## Tasks

Go to:
- `task01.ts` — primitives and explicit annotations
- `task02.ts` — arrays and tuples
- `task03.ts` — any vs unknown vs never
