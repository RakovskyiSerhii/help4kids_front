// Lesson 10 / Task 03 — Promise.all and async class
//
// Run: npx tsx 10_async/task03.ts
//
// Expected output (exact):
// User: Serhii | Courses: 3
// Batch: [1,4,9]
// -----------------------------------------------

interface User {
  id: string;
  name: string;
}

interface Course {
  id: string;
  title: string;
}

// Simulated data — do not modify.
async function fetchUser(id: string): Promise<User> {
  return { id, name: 'Serhii' };
}

async function fetchCourses(userId: string): Promise<Course[]> {
  void userId;
  return [
    { id: 'c1', title: 'Angular' },
    { id: 'c2', title: 'TypeScript' },
    { id: 'c3', title: 'RxJS' },
  ];
}


// TODO 1: Write an async function `loadDashboard` that takes `userId: string`
//         and returns `Promise<{ user: User; courses: Course[] }>`.
//         Use `Promise.all` to fetch user and courses IN PARALLEL (one await, two calls).
//         Destructure the result into [user, courses].
//         Return type must be explicit.


// TODO 2: Implement a class `BatchProcessor` with:
//   - A private field `tasks: Array<() => Promise<number>>` (a list of async jobs)
//   - Method `add(task: () => Promise<number>): void` — appends to tasks
//   - Async method `runAll(): Promise<number[]>` — runs all tasks concurrently
//     using Promise.all and returns their results.
//     Return type: Promise<number[]>.
//
//   All fields and methods must have explicit access modifiers and return types.


// --- DO NOT EDIT BELOW THIS LINE ---
(async (): Promise<void> => {
  const { user, courses } = await loadDashboard('user-1');
  console.log(`User: ${user.name} | Courses: ${courses.length}`);

  const processor = new BatchProcessor();
  processor.add(async (): Promise<number> => 1 * 1);
  processor.add(async (): Promise<number> => 2 * 2);
  processor.add(async (): Promise<number> => 3 * 3);
  const results: number[] = await processor.runAll();
  console.log(`Batch: ${JSON.stringify(results)}`);
})();
