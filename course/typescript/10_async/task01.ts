// Lesson 10 / Task 01 — Promise typing and basic async
//
// Run: npx tsx 10_async/task01.ts
//
// Expected output (exact):
// User: Serhii | serhii@example.com
// Delayed: hello after 0ms
// Numbers: [1,2,3]
// -----------------------------------------------

interface User {
  id: string;
  name: string;
  email: string;
}

// Simulated data — do not modify.
const db: Record<string, User> = {
  '1': { id: '1', name: 'Serhii', email: 'serhii@example.com' },
};


// TODO 1: Write an async function `getUser` that takes `id: string`
//         and returns `Promise<User | null>`.
//         - If db[id] exists, return it.
//         - Otherwise return null.
//         The return type annotation `Promise<User | null>` must be explicit.


// TODO 2: Write a function `delay` that takes `ms: number` and a `value: string`
//         and returns `Promise<string>`.
//         It should resolve with the value after `ms` milliseconds.
//         Use: return new Promise<string>(resolve => setTimeout(() => resolve(value), ms))
//         Return type: Promise<string> (explicit).


// TODO 3: Write an async function `getNumbers` that returns `Promise<number[]>`.
//         It simply resolves with [1, 2, 3].
//         Use `return Promise.resolve([1, 2, 3])` (do NOT use the async keyword here —
//         just return the Promise directly, but annotate the return type explicitly).


// --- DO NOT EDIT BELOW THIS LINE ---
(async (): Promise<void> => {
  const user: User | null = await getUser('1');
  if (user) console.log(`User: ${user.name} | ${user.email}`);

  const msg: string = await delay(0, 'hello');
  console.log(`Delayed: ${msg} after 0ms`);

  const nums: number[] = await getNumbers();
  console.log(`Numbers: ${JSON.stringify(nums)}`);
})();
