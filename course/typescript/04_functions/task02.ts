// Lesson 04 / Task 02 — Optional, default parameters, void
//
// Run: npx tsx 04_functions/task02.ts
//
// Expected output (exact):
// Hello, Serhii!
// Good morning, Serhii!
// Serhii (admin)
// Bob (user)
// Logged: system start
// -----------------------------------------------

// TODO 1: Write a function `greet` that takes:
//         - name: string (required)
//         - greeting: optional string
//         If greeting is provided: return '<greeting>, <name>!'
//         If not: return 'Hello, <name>!'
//         Return type: string.


// TODO 2: Write a function `formatUser` that takes:
//         - name: string (required)
//         - role: string with default value 'user'
//         Returns '<name> (<role>)'
//         Return type: string.


// TODO 3: Write a function `logEvent` that takes a message of type string
//         and returns void.
//         It should print 'Logged: <message>' to the console.
//         Return type must be explicitly `void`.


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(greet('Serhii'));
console.log(greet('Serhii', 'Good morning'));
console.log(formatUser('Serhii', 'admin'));
console.log(formatUser('Bob'));
logEvent('system start');
