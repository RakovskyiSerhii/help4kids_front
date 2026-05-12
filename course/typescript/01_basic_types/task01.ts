// Lesson 01 / Task 01 — Primitives and explicit annotations
//
// Run: npx tsx 01_basic_types/task01.ts
//
// Expected output (exact):
// Name: Serhii, Age: 31, Active: true
// PI is approximately 3.14
// Status: inactive
// -----------------------------------------------

// TODO 1: Declare a variable `firstName` of type string with value 'Serhii'.
//         Declare a variable `age` of type number with value 31.
//         Declare a variable `isActive` of type boolean with value true.


// TODO 2: Declare a constant `PI` of type number with value 3.14159.
//         Declare a variable `status` of type string with value 'active'.
//         Then reassign `status` to 'inactive'.
//         (This tests the difference between let and const — PI must be const.)


// TODO 3: Write a function `describe` that takes a name of type string,
//         an age of type number, and an active flag of type boolean,
//         and returns a string formatted as: "Name: X, Age: Y, Active: Z"
//         The return type must be explicit.


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(describe(firstName, age, isActive));
console.log(`PI is approximately ${PI.toFixed(2)}`);
console.log(`Status: ${status}`);
