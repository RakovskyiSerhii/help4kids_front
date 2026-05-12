// Lesson 02 / Task 02 — Optional chaining and nullish coalescing
//
// Run: npx tsx 02_null_safety/task02.ts
//
// Expected output (exact):
// City: Kyiv
// City: Unknown city
// Score: 0
// Score: 100
// -----------------------------------------------

interface Address {
  city: string;
}

interface Profile {
  address: Address | null;
}

interface User {
  name: string;
  profile: Profile | null;
  score: number | null;
}

// TODO 1: Write a function `getCity` that takes a `user` of type `User | null`
//         and returns the city string using optional chaining.
//         If any part of the chain is null/undefined, return 'Unknown city'
//         using nullish coalescing `??`.
//         You must use `?.` — do NOT use manual if-null checks.
//         Return type: string.


// TODO 2: Write a function `getScore` that takes a `user` of type `User | null`
//         and returns the score.
//         - If user or user.score is null, return 100 (default).
//         - Use `??` to provide the default, NOT `||`.
//         Return type: number.
//         (Hint: 0 is a valid score — ?? vs || matters here.)


// --- DO NOT EDIT BELOW THIS LINE ---
const userWithCity: User = {
  name: 'Serhii',
  profile: { address: { city: 'Kyiv' } },
  score: 0,
};

const userWithoutCity: User = {
  name: 'Bob',
  profile: null,
  score: null,
};

console.log('City:', getCity(userWithCity));
console.log('City:', getCity(null));
console.log('Score:', getScore(userWithCity));    // 0 — not the default
console.log('Score:', getScore(userWithoutCity)); // 100 — default
