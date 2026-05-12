// Lesson 09 / Task 01 — Mapped Types
//
// Run: npx tsx 09_advanced_types/task01.ts
//
// Expected output (exact):
// nullable id: null
// nullable name: null
// mutable name: changed
// -----------------------------------------------

interface Product {
  id: string;
  name: string;
  price: number;
}

// TODO 1: Write a mapped type `Nullable<T>` that makes every field of T
//         nullable (T[K] | null). Use the [K in keyof T] syntax.
//         Do NOT use Partial — the fields are still required, just nullable.


// TODO 2: Write a mapped type `Mutable<T>` that removes the `readonly` modifier
//         from every field of T.
//         Hint: `-readonly [K in keyof T]: T[K]`  (the `-` removes the modifier)


// TODO 3: Write a mapped type `Stringify<T>` that changes every field type to string,
//         keeping the same keys.
//         (This models a scenario like serializing all values to strings for a form.)


// --- DO NOT EDIT BELOW THIS LINE ---
const nullableProduct: Nullable<Product> = { id: null, name: null, price: null };
console.log('nullable id:', nullableProduct.id);
console.log('nullable name:', nullableProduct.name);

const frozenProduct: Readonly<Product> = { id: '1', name: 'Widget', price: 9 };
const mutableProduct: Mutable<typeof frozenProduct> = { ...frozenProduct };
mutableProduct.name = 'changed';  // should compile — no longer readonly
// If Mutable<T> is wrong, TypeScript will error here.
void mutableProduct;
console.log('mutable name:', mutableProduct.name);

// Stringify test — compile-time only (no output needed)
type StringProduct = Stringify<Product>;
const _sp: StringProduct = { id: '1', name: 'Widget', price: '9.99' };
void _sp;
