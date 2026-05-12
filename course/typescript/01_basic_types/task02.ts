// Lesson 01 / Task 02 — Arrays and Tuples
//
// Run: npx tsx 01_basic_types/task02.ts
//
// Expected output (exact):
// Scores: [10, 20, 30]
// First score: 10
// Names: ["Alice","Bob","Charlie"]
// Tag: error, Code: 404
// RGB: 255,128,0
// -----------------------------------------------

// TODO 1: Declare `scores` as an array of numbers containing [10, 20, 30].
//         Use the `number[]` syntax (not Array<number>).


// TODO 2: Declare `names` as an array of strings containing ['Alice', 'Bob', 'Charlie'].
//         Use the `Array<string>` generic syntax (not string[]).


// TODO 3: Declare a tuple `errorEntry` typed as [string, number].
//         Assign it the value ['error', 404].


// TODO 4: Declare a tuple `color` typed as [number, number, number].
//         Assign it the value [255, 128, 0].
//         This represents an RGB color.


// TODO 5: Write a function `firstScore` that takes an array of numbers
//         and returns the first element as a number.
//         Return type must be explicit.


// --- DO NOT EDIT BELOW THIS LINE ---
console.log('Scores:', scores);
console.log('First score:', firstScore(scores));
console.log('Names:', JSON.stringify(names));
console.log(`Tag: ${errorEntry[0]}, Code: ${errorEntry[1]}`);
console.log(`RGB: ${color[0]},${color[1]},${color[2]}`);
