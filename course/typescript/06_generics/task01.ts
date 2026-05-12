// Lesson 06 / Task 01 — Generic functions
//
// Run: npx tsx 06_generics/task01.ts
//
// Expected output (exact):
// Last number: 3
// Last string: cherry
// Last: undefined
// Unique: [1,2,3,4]
// Reversed: [3,2,1]
// -----------------------------------------------

// TODO 1: Write a generic function `last` that takes an array of type T
//         and returns the last element (T | undefined if array could be empty).
//         Return type must be explicit: T | undefined.


// TODO 2: Write a generic function `unique` that takes an array of type T
//         and returns a new array with duplicates removed.
//         Constraint: T must extend string | number (to be comparable).
//         Hint: use Set to deduplicate.
//         Return type: T[]


// TODO 3: Write a generic function `reversed` that takes an array of type T
//         and returns a NEW reversed array (do not mutate the original).
//         Return type: T[]


// --- DO NOT EDIT BELOW THIS LINE ---
console.log('Last number:', last([1, 2, 3]));
console.log('Last string:', last(['apple', 'banana', 'cherry']));
console.log('Last:', last([]));
console.log('Unique:', JSON.stringify(unique([1, 2, 2, 3, 3, 4])));
console.log('Reversed:', JSON.stringify(reversed([1, 2, 3])));
