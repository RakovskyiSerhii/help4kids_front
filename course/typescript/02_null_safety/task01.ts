// Lesson 02 / Task 01 — Nullable types
//
// Run: npx tsx 02_null_safety/task01.ts
//
// Expected output (exact):
// Hello, Serhii
// Hello, stranger
// Bio length: 5
// Bio length: unknown
// -----------------------------------------------

// TODO 1: Write a function `greet` that takes a parameter `name` which
//         can be a string OR null.
//         - If name is not null, return 'Hello, <name>'
//         - If name is null, return 'Hello, stranger'
//         All types must be explicit. Return type must be explicit.


// TODO 2: Write a function `bioLength` that takes a `bio` parameter
//         which can be a string OR undefined.
//         - If bio is defined, return 'Bio length: <length>'
//         - If bio is undefined, return 'Bio length: unknown'
//         Use string | undefined as the parameter type (not optional `?`).
//         Return type must be explicit.


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(greet('Serhii'));
console.log(greet(null));
console.log(bioLength('hello'));
console.log(bioLength(undefined));
