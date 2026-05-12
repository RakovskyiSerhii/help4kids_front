// Lesson 08 / Task 01 — typeof and instanceof guards
//
// Run: npx tsx 08_type_narrowing/task01.ts
//
// Expected output (exact):
// HELLO
// 3.14
// true
// Dog barks
// Cat meows
// -----------------------------------------------

// TODO 1: Write a function `display` that takes `value: string | number | boolean`
//         and returns a string:
//         - string  → return uppercased
//         - number  → return toFixed(2)
//         - boolean → return 'true' or 'false'
//         Use `typeof` guards. Return type: string.
//         All three branches must be covered — no fallthrough.


// Classes for TODO 2 — do not modify.
class Cat {
  public speak(): string { return 'Cat meows'; }
}
class Dog {
  public speak(): string { return 'Dog barks'; }
}


// TODO 2: Write a function `makeNoise` that takes `animal: Cat | Dog`
//         and returns the result of calling the correct speak() method.
//         Use `instanceof` to narrow.
//         Return type: string.
//         Do NOT call a generic `.speak()` — narrow first, then call.


// --- DO NOT EDIT BELOW THIS LINE ---
console.log(display('hello'));
console.log(display(3.14159));
console.log(display(true));

console.log(makeNoise(new Dog()));
console.log(makeNoise(new Cat()));
