// Lesson 01 / Task 03 — any vs unknown vs never
//
// Run: npx tsx 01_basic_types/task03.ts
//
// Expected output (exact):
// HELLO WORLD
// 42
// Cannot process: not a string or number
// -----------------------------------------------

// TODO 1: Write a function `processUnknown` that takes a parameter of type `unknown`
//         and returns a string.
//         - If the value is a string, return it converted to UPPERCASE.
//         - If the value is a number, return its string representation.
//         - Otherwise, return 'Cannot process: not a string or number'.
//
//         Rules:
//         - Parameter type must be `unknown`, NOT `any`.
//         - You must use `typeof` to narrow the type before accessing it.
//         - Return type must be explicit.


// TODO 2: Write a function `assertNonEmpty` that takes a value of type `unknown`
//         and returns `never` if the value is null, undefined, or an empty string.
//         Otherwise it returns the value as a string.
//
//         Hint: a function returning `never` must throw — it cannot return.
//         Signature: function assertNonEmpty(value: unknown): string


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(processUnknown('hello world'));
console.log(processUnknown(42));
console.log(processUnknown(true));

// This should print 'Serhii'
console.log(assertNonEmpty('Serhii'));

// This should throw — wrap in try/catch to see the message
try {
  assertNonEmpty('');
} catch (e: unknown) {
  if (e instanceof Error) console.log('Caught:', e.message);
}
