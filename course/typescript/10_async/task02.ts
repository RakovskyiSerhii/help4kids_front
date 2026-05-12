// Lesson 10 / Task 02 — Error handling in async
//
// Run: npx tsx 10_async/task02.ts
//
// Expected output (exact):
// Success: hello from API
// Error caught: Not found: item-999
// Fallback used: default value
// -----------------------------------------------

// Simulated API — do not modify.
async function fakeApi(id: string): Promise<string> {
  if (id === 'ok') return 'hello from API';
  throw new Error(`Not found: ${id}`);
}


// TODO 1: Write an async function `safeFetch` that takes `id: string`
//         and returns `Promise<string>`.
//         - Call fakeApi(id) in a try/catch.
//         - On success: return the result prefixed with 'Success: '
//         - On error: catch with type `unknown`.
//           If it is an Error instance, return 'Error caught: ' + err.message.
//           Otherwise return 'Unknown error'.
//         Return type: Promise<string> (explicit).
//         The catch parameter must be typed `unknown`, NOT `any` or `Error`.


// TODO 2: Write an async function `fetchWithFallback` that takes:
//         - id: string
//         - fallback: string
//         Returns Promise<string>.
//         - Try to call fakeApi(id).
//         - If it succeeds, return the result.
//         - If it throws (any error), return the fallback value.
//         Return type: Promise<string> (explicit).


// --- DO NOT EDIT BELOW THIS LINE ---
(async (): Promise<void> => {
  console.log(await safeFetch('ok'));
  console.log(await safeFetch('item-999'));
  console.log(await fetchWithFallback('bad-id', 'Fallback used: default value'));
})();
