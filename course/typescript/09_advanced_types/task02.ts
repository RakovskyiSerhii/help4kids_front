// Lesson 09 / Task 02 — Conditional types and infer
//
// Run: npx tsx 09_advanced_types/task02.ts
//
// Expected output (exact):
// Type checks compile correctly
// Element extracted: number
// -----------------------------------------------

// TODO 1: Write a conditional type `IsArray<T>` that evaluates to:
//         - `true`  if T extends any[]
//         - `false` otherwise
//
//         Type-level tests (compile-time, no runtime output):
//         type T1 = IsArray<number[]>;   // must be: true
//         type T2 = IsArray<string>;     // must be: false
//         Declare T1 and T2, then assert them below.


// TODO 2: Write a conditional type `Flatten<T>` that:
//         - If T is an array (T extends Array<infer E>), returns E
//         - Otherwise returns T
//         This extracts the element type from an array, or returns T as-is.
//
//         Type-level tests:
//         type F1 = Flatten<number[]>;   // number
//         type F2 = Flatten<string>;     // string
//         type F3 = Flatten<boolean[]>;  // boolean


// TODO 3: Write a conditional type `NonNullable2<T>` (use a different name to avoid
//         conflict with the built-in) that removes null and undefined from T:
//         T extends null | undefined ? never : T
//
//         Type-level test:
//         type N1 = NonNullable2<string | null>;       // string
//         type N2 = NonNullable2<number | undefined>;  // number


// --- DO NOT EDIT BELOW THIS LINE ---

// Compile-time assertions — these lines will ERROR if your types are wrong.
// They verify the conditional type produces the expected result.
const _t1: IsArray<number[]> = true;
const _t2: IsArray<string> = false;
void _t1; void _t2;

// Flatten runtime demonstration
const nums: number[] = [1, 2, 3];
const firstNum: Flatten<typeof nums> = nums[0]!;  // Flatten<number[]> = number
console.log('Type checks compile correctly');
console.log('Element extracted:', firstNum);
