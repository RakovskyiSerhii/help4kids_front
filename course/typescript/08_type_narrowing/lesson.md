# Lesson 08 — Type Narrowing

TypeScript's type system is flow-sensitive: inside an `if` block, TypeScript knows more about the type than outside. This is called narrowing.

---

## `typeof` guard — for primitives

```typescript
function process(value: string | number): string {
  if (typeof value === 'string') {
    return value.toUpperCase();  // TypeScript knows: value is string here
  }
  return value.toFixed(2);       // TypeScript knows: value is number here
}
```

| Dart | TypeScript |
|------|------------|
| `value is String` | `typeof value === 'string'` |
| `value is int` | `typeof value === 'number'` |

---

## `instanceof` guard — for class instances

```typescript
class Cat { meow(): void { console.log('meow'); } }
class Dog { bark(): void { console.log('woof'); } }

function makeNoise(animal: Cat | Dog): void {
  if (animal instanceof Cat) {
    animal.meow();  // narrowed to Cat
  } else {
    animal.bark();  // narrowed to Dog
  }
}
```

| Dart | TypeScript |
|------|------------|
| `animal is Cat` | `animal instanceof Cat` |

---

## Discriminated unions

The most powerful pattern. Add a `kind` (or `type`) literal field to each variant so TypeScript can narrow the union by checking that field:

```typescript
type Shape =
  | { kind: 'circle'; radius: number }
  | { kind: 'rectangle'; width: number; height: number };

function area(shape: Shape): number {
  switch (shape.kind) {
    case 'circle':    return Math.PI * shape.radius ** 2;
    case 'rectangle': return shape.width * shape.height;
  }
}
```

The `kind` field is called the **discriminant**. It must be a literal type (exact string/number), not just `string`.

| Dart | TypeScript |
|------|------------|
| `sealed class Shape` | Discriminated union type |
| `switch (shape) { case Circle c => ... }` | `switch (shape.kind) { case 'circle': ... }` |

---

## Custom type guards

A function that returns `value is T` is a type predicate — it tells TypeScript "if this function returns true, the value is T":

```typescript
function isString(value: unknown): value is string {
  return typeof value === 'string';
}

const val: unknown = 'hello';
if (isString(val)) {
  val.toUpperCase();  // TypeScript knows it's a string
}
```

---

## Exhaustiveness check with `never`

When you have a discriminated union, TypeScript can verify you handled all cases:

```typescript
function area(shape: Shape): number {
  switch (shape.kind) {
    case 'circle':    return Math.PI * shape.radius ** 2;
    case 'rectangle': return shape.width * shape.height;
    default: {
      const _exhaustive: never = shape;  // ERROR if a case is missing
      return _exhaustive;
    }
  }
}
```

If you add a new variant to `Shape` but forget to add a case, TypeScript will error on the `never` assignment.

---

## Tasks

- `task01.ts` — typeof and instanceof guards
- `task02.ts` — discriminated unions with switch
- `task03.ts` — custom type guard functions and exhaustiveness
