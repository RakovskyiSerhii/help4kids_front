// Lesson 06 / Task 02 — Generic interfaces and keyof
//
// Run: npx tsx 06_generics/task02.ts
//
// Expected output (exact):
// Status: 200, Count: 3
// serhii@example.com
// Serhii
// 30
// -----------------------------------------------

// TODO 1: Define a generic interface `PagedResponse<T>` with:
//   - items: T[]
//   - total: number
//   - status: number


// TODO 2: Write a function `summarize` that takes a `PagedResponse<T>` (for any T)
//         and returns: 'Status: <status>, Count: <items.length>'
//         Return type: string.
//         The type parameter T must appear in the signature.


// TODO 3: Define an interface `User` with:
//   - id: string
//   - email: string
//   - name: string
//   - age: number


// TODO 4: Write a generic function `getField` that takes:
//   - obj: T
//   - key: K (constrained to keyof T)
//   Returns: T[K]
//   This function must be fully generic — no `any`, no casting.
//   TypeScript should infer the return type from T and K.


// --- DO NOT EDIT BELOW THIS LINE ---
const response: PagedResponse<string> = {
  items: ['a', 'b', 'c'],
  total: 3,
  status: 200,
};
console.log(summarize(response));

const user: User = { id: '1', email: 'serhii@example.com', name: 'Serhii', age: 30 };
console.log(getField(user, 'email'));  // string
console.log(getField(user, 'name'));   // string
console.log(getField(user, 'age'));    // number
