// Lesson 07 / Task 01 — Partial, Required, Readonly
//
// Run: npx tsx 07_utility_types/task01.ts
//
// Expected output (exact):
// Updated: TypeScript Pro | price: 99
// Required fields present: true
// Cannot reassign frozen course title
// -----------------------------------------------

interface Course {
  id: string;
  title: string;
  price: number;
  contentUrl: string;
  published: boolean;
}

// TODO 1: Declare a type `UpdateCourseDto` using `Partial<Course>`.
//         Do NOT rewrite the interface manually.


// TODO 2: Declare a type `FullCourse` using `Required<Course>`.
//         Do NOT rewrite the interface manually.


// TODO 3: Declare a type `FrozenCourse` using `Readonly<Course>`.
//         Do NOT rewrite the interface manually.


// TODO 4: Write a function `applyUpdate` that takes:
//         - course: Course
//         - update: UpdateCourseDto
//         Returns a NEW Course with the update applied (spread operator).
//         Do not mutate the input. Return type: Course.


// TODO 5: Write a function `isFull` that takes a `FullCourse` and
//         returns true if all string fields are non-empty.
//         Checks: id, title, contentUrl are all non-empty strings.
//         Return type: boolean.


// --- DO NOT EDIT BELOW THIS LINE ---
const base: Course = {
  id: 'c1',
  title: 'Angular Basics',
  price: 49,
  contentUrl: 'https://example.com/c1',
  published: false,
};

const updated: Course = applyUpdate(base, { title: 'TypeScript Pro', price: 99 });
console.log(`Updated: ${updated.title} | price: ${updated.price}`);

const full: FullCourse = {
  id: 'c2',
  title: 'Advanced TS',
  price: 79,
  contentUrl: 'https://example.com/c2',
  published: true,
};
console.log(`Required fields present: ${isFull(full)}`);

const frozen: FrozenCourse = { ...base };
try {
  // This should cause a TypeScript compile error — but at runtime the assignment
  // would still work unless we use Object.freeze. Here we just demonstrate the type.
  // The point is: TypeScript will refuse to compile the line below.
  // Comment it out after you've seen the error, or leave it commented from the start.
  // (frozen as Course).title = 'Hacked';
  console.log('Cannot reassign frozen course title');
} catch {
  console.log('Cannot reassign frozen course title');
}
