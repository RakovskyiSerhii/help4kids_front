# Lesson 04 — Functions

Functions in TypeScript look like JavaScript functions with type annotations. Coming from Dart, the patterns are familiar — the syntax differences are small.

---

## Basic function signature

```typescript
// Dart:   String greet(String name, int age) { ... }
// TypeScript:
function greet(name: string, age: number): string {
  return `${name} is ${age}`;
}

// Arrow function (identical semantics, different syntax)
const greet = (name: string, age: number): string => `${name} is ${age}`;
```

Always annotate:
1. Every parameter type.
2. The return type — even if TypeScript can infer it.

---

## Optional and default parameters

```typescript
// Optional — may be omitted by the caller (value is undefined inside)
// Dart: String greet(String name, [String? title])
function greet(name: string, title?: string): string {
  return title ? `${title} ${name}` : name;
}

// Default — has a fallback value if omitted
// Dart: String greet(String name, {String role = 'user'})
function greet(name: string, role: string = 'user'): string {
  return `${name} (${role})`;
}
```

Rules:
- Optional and default parameters must come **after** required parameters.
- Do not combine `?` and `= value` on the same parameter.

---

## Function overloads

TypeScript allows declaring multiple signatures for the same function:

```typescript
function format(value: string): string;
function format(value: number): string;
function format(value: string | number): string {
  // implementation handles both cases
  return typeof value === 'string' ? value.toUpperCase() : value.toFixed(2);
}
```

The last signature (with `string | number`) is the **implementation signature** — it is not visible to callers. Callers only see the overloads above it.

| Dart | TypeScript |
|------|------------|
| No overloads (use named constructors) | Overload signatures + implementation |
| `static T of<T>(...)` | `function of<T>(...)` |

---

## void vs never

```typescript
// void — returns undefined (or nothing). Can be called, completes normally.
function log(msg: string): void {
  console.log(msg);
}

// never — never returns. Either throws or runs forever.
function crash(msg: string): never {
  throw new Error(msg);
}
```

---

## Tasks

- `task01.ts` — typed parameters and return types
- `task02.ts` — optional, default parameters, and void
- `task03.ts` — function overloads
