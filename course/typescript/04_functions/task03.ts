// Lesson 04 / Task 03 — Function overloads
//
// Run: npx tsx 04_functions/task03.ts
//
// Expected output (exact):
// HELLO
// 3.14
// true
// 42
// -----------------------------------------------

// TODO 1: Write a function `stringify` with overloads:
//         - stringify(value: string): string  → returns the string uppercased
//         - stringify(value: number): string  → returns the number with 2 decimal places
//         - stringify(value: boolean): string → returns 'true' or 'false'
//
//         Then write the implementation that handles all three cases.
//         The implementation signature should be `stringify(value: string | number | boolean): string`.
//         The implementation signature must NOT be one of the visible overloads.


// TODO 2: Write a function `first` with overloads:
//         - first(items: string[]): string
//         - first(items: number[]): number
//
//         Implementation: returns the first element of the array.
//         The implementation signature: first(items: string[] | number[]): string | number
//
//         Important: the return type of each overload must match the input type.
//         Calling first(['a']) returns string. Calling first([1]) returns number.


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(stringify('hello'));   // HELLO
console.log(stringify(3.14159));   // 3.14
console.log(stringify(true));      // true

console.log(first([42, 10, 5]));   // 42
