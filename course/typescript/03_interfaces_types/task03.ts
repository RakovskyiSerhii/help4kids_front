// Lesson 03 / Task 03 — Type aliases for unions and function signatures
//
// Run: npx tsx 03_interfaces_types/task03.ts
//
// Expected output (exact):
// pending → In progress
// paid → Paid
// failed → Failed
// Input 5 → Result: 25
// Input hello → Result: HELLO
// -----------------------------------------------

// TODO 1: Define a type alias `OrderStatus` that is a union of the
//         string literals: 'pending', 'paid', 'failed'.


// TODO 2: Write a function `statusLabel` that takes an `OrderStatus`
//         and returns a human-readable string:
//         'pending' → 'In progress'
//         'paid'    → 'Paid'
//         'failed'  → 'Failed'
//         Use a switch statement. Return type: string.
//         The switch must be exhaustive — TypeScript should complain if you add a
//         new status to the union but forget to handle it.
//         (Hint: add a `default: const _check: never = status;` at the end.)


// TODO 3: Define a type alias `Transformer` for a function that:
//         - takes one argument of type `unknown`
//         - returns a string


// TODO 4: Write two functions that match the `Transformer` type:
//         - `doubleToString`: if the input is a number, return '<n * 2>' as string.
//           Otherwise return String(input).
//         - `upperOrString`: if the input is a string, return it uppercased.
//           Otherwise return String(input).
//         Declare both with the explicit type `Transformer`.
//         (const doubleToString: Transformer = ...)


// --- DO NOT EDIT BELOW THIS LINE ---
const statuses: OrderStatus[] = ['pending', 'paid', 'failed'];
statuses.forEach(s => console.log(`${s} → ${statusLabel(s)}`));

console.log(`Input 5 → Result: ${doubleToString(5)}`);
console.log(`Input hello → Result: ${upperOrString('hello')}`);
