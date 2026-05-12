// Lesson 06 / Task 03 — Generic class
//
// Run: npx tsx 06_generics/task03.ts
//
// Expected output (exact):
// Empty: true
// Pushed 10, 20, 30
// Peek: 30
// Pop: 30
// Size: 2
// Empty: false
// -----------------------------------------------

// TODO: Implement a generic class `Stack<T>` with:
//
//   Private field `items: T[]` initialized to empty array.
//
//   Methods:
//   - push(item: T): void         — adds item to the top
//   - pop(): T | undefined        — removes and returns the top item (undefined if empty)
//   - peek(): T | undefined       — returns top item WITHOUT removing it
//   - get size(): number          — getter (not a method) — returns items.length
//   - get isEmpty(): boolean      — getter — returns true if size is 0
//
//   All methods and fields must have explicit access modifiers and return types.
//   The `items` field must be private.


// --- DO NOT EDIT BELOW THIS LINE ---
const stack = new Stack<number>();
console.log('Empty:', stack.isEmpty);

stack.push(10);
stack.push(20);
stack.push(30);
console.log('Pushed 10, 20, 30');
console.log('Peek:', stack.peek());
console.log('Pop:', stack.pop());
console.log('Size:', stack.size);
console.log('Empty:', stack.isEmpty);
