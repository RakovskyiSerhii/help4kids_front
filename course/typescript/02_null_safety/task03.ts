// Lesson 02 / Task 03 — Non-null assertion and optional parameters
//
// Run: npx tsx 02_null_safety/task03.ts
//
// Expected output (exact):
// Dr. Serhii
// Serhii
// Welcome back, Serhii! Last seen: 2024-01-15
// Welcome, newcomer!
// admin-001
// -----------------------------------------------

// TODO 1: Write a function `formatName` that takes:
//         - `name`: string (required)
//         - `title`: optional string
//         If title is provided, return '<title> <name>'.
//         Otherwise return just '<name>'.
//         Use optional parameter syntax `title?: string`, NOT `title: string | undefined`.
//         Return type: string.


// TODO 2: Write a function `welcomeMessage` that takes:
//         - `name`: string
//         - `lastSeen`: string | null
//         If lastSeen is not null, return 'Welcome back, <name>! Last seen: <lastSeen>'
//         If lastSeen is null, return 'Welcome, newcomer!'
//         Return type: string.


// TODO 3: The array below is guaranteed to always have at least one element
//         (it comes from a validated API response). Use the non-null assertion `!`
//         to get the first element without an undefined check.
//         Assign the result to `firstAdmin` with type string.
//         This is one of the rare valid uses of `!`.

const adminIds: string[] = ['admin-001', 'admin-002'];
// TODO: declare firstAdmin using non-null assertion on adminIds[0]


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(formatName('Serhii', 'Dr.'));
console.log(formatName('Serhii'));
console.log(welcomeMessage('Serhii', '2024-01-15'));
console.log(welcomeMessage('stranger', null));
console.log(firstAdmin);
