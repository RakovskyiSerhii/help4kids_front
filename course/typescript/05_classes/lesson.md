# Lesson 05 — Classes

TypeScript classes are syntactic sugar over JavaScript prototype chains. They look and behave like Dart classes with a few key differences.

---

## Basic class

```typescript
class Animal {
  public name: string;
  private age: number;
  protected species: string;
  readonly id: string;

  constructor(name: string, age: number, species: string) {
    this.name = name;
    this.age = age;
    this.species = species;
    this.id = crypto.randomUUID();
  }

  speak(): string {
    return `${this.name} makes a sound`;
  }
}
```

| Dart | TypeScript |
|------|------------|
| `final String id` | `readonly id: string` |
| `String _name` (private by convention) | `private name: string` |
| `String name` (public) | `public name: string` (or just `name: string`) |
| Default is private with `_` prefix | Default is **public** |

> Unlike Dart, TypeScript's `private` is a compile-time check only. At runtime the field is accessible. Use `#name` for true JS private fields if needed.

---

## Constructor shorthand

TypeScript has a shorthand that Dart does NOT have — declaring and assigning fields directly in the constructor parameter list:

```typescript
// Long form
class Service {
  private url: string;
  constructor(url: string) { this.url = url; }
}

// Shorthand — `private url` in the parameter creates AND assigns the field
class Service {
  constructor(private url: string) {}
}
```

---

## Inheritance

```typescript
class Animal {
  constructor(public name: string) {}
  speak(): string { return `${this.name} makes a sound`; }
}

class Dog extends Animal {
  constructor(name: string, public breed: string) {
    super(name);  // must call super() before using this
  }

  override speak(): string {  // `override` keyword prevents silent typos
    return `${this.name} barks`;
  }
}
```

| Dart | TypeScript |
|------|------------|
| `class Dog extends Animal` | same |
| `super.speak()` | same |
| `@override` annotation | `override` keyword |

---

## Interfaces and `implements`

```typescript
interface Printable {
  print(): void;
}

interface Serializable {
  serialize(): string;
}

class Report implements Printable, Serializable {
  print(): void { console.log(this.serialize()); }
  serialize(): string { return JSON.stringify(this); }
}
```

---

## Abstract classes

```typescript
abstract class Shape {
  abstract area(): number;          // must be implemented by subclasses

  describe(): string {              // concrete method — shared by all subclasses
    return `Area is ${this.area()}`;
  }
}

class Circle extends Shape {
  constructor(private radius: number) { super(); }
  area(): number { return Math.PI * this.radius ** 2; }
}

// new Shape();  // ERROR — cannot instantiate abstract class
```

---

## Tasks

- `task01.ts` — basic class with access modifiers and constructor shorthand
- `task02.ts` — inheritance with `extends` and `override`
- `task03.ts` — abstract class and `implements`
