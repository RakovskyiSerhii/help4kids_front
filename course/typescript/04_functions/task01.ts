// Lesson 04 / Task 01 — Typed parameters and return types
//
// Run: npx tsx 04_functions/task01.ts
//
// Expected output (exact):
// 15
// true
// false
// Serhii Rakovskyi
// -----------------------------------------------

// TODO 1: Write a function `sum` that takes two numbers and returns their sum.
//         All types explicit.


// TODO 2: Write a function `isAdult` that takes an age (number) and
//         returns true if age >= 18, false otherwise.
//         All types explicit.


// TODO 3: Write a function `fullName` that takes firstName and lastName
//         (both strings) and returns them joined with a space.
//         All types explicit.


// TODO 4: Write an arrow function `double` that takes a number and
//         returns its double. Declare it as a const with explicit types.
//         Syntax: const double = (n: number): number => ...


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(sum(7, 8));
console.log(isAdult(20));
console.log(isAdult(15));
console.log(fullName('Serhii', 'Rakovskyi'));
// double is tested below — no console.log here, checked via sum usage
const result: number = double(sum(3, 4));  // double(7) = 14 — must type-check
void result;
