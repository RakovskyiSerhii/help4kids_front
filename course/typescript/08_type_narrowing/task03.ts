// Lesson 08 / Task 03 — Custom type guard functions
//
// Run: npx tsx 08_type_narrowing/task03.ts
//
// Expected output (exact):
// hello is a string
// 42 is not a string
// Is user: true
// Is user: false
// Processed: HELLO
// Processed: 99
// -----------------------------------------------

interface User {
  id: string;
  name: string;
  email: string;
}

// TODO 1: Write a custom type guard function `isString` that takes `value: unknown`
//         and returns `value is string`.
//         The return type annotation MUST be `value is string`, not `boolean`.


// TODO 2: Write a custom type guard function `isUser` that takes `value: unknown`
//         and returns `value is User`.
//         Check that:
//         - value is an object (not null)
//         - value has an `id` field of type string
//         - value has a `name` field of type string
//         - value has an `email` field of type string
//         Use `typeof` checks. Return type annotation: `value is User`.


// TODO 3: Write a function `processInput` that takes `input: string | number`
//         and returns a string.
//         Use your `isString` guard:
//         - if string: return uppercased
//         - if number: return the number + 1, converted to string
//         Return type: string.


// --- DO NOT EDIT BELOW THIS LINE ---
const val1: unknown = 'hello';
const val2: unknown = 42;

console.log(`${val1} is${isString(val1) ? '' : ' not'} a string`);
console.log(`${val2} is${isString(val2) ? '' : ' not'} a string`);

const validUser: unknown = { id: '1', name: 'Serhii', email: 'serhii@example.com' };
const notUser: unknown = { id: '1', name: 'Serhii' };  // missing email

console.log('Is user:', isUser(validUser));
console.log('Is user:', isUser(notUser));

console.log('Processed:', processInput('hello'));
console.log('Processed:', processInput(98));
