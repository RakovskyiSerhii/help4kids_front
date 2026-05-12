// Lesson 07 / Task 02 — Pick, Omit, Record
//
// Run: npx tsx 07_utility_types/task02.ts
//
// Expected output (exact):
// Card: c1 | Angular Basics | $49
// Create DTO keys: title,price,contentUrl,published
// alice: 95
// bob: 82
// charlie: 78
// -----------------------------------------------

interface Course {
  id: string;
  title: string;
  price: number;
  contentUrl: string;
  published: boolean;
}

// TODO 1: Declare `CourseCard` using `Pick<Course, ...>` — keep only id, title, price.


// TODO 2: Declare `CreateCourseDto` using `Omit<Course, ...>` — exclude id.


// TODO 3: Declare `ScoreMap` using `Record<string, number>`.


// TODO 4: Write a function `formatCard` that takes a `CourseCard` and
//         returns '<id> | <title> | $<price>'
//         Return type: string.


// TODO 5: Write a function `buildScoreMap` that takes an array of
//         `{ name: string; score: number }` objects and returns a `ScoreMap`
//         (an object mapping name → score).
//         Return type: ScoreMap.


// --- DO NOT EDIT BELOW THIS LINE ---
const card: CourseCard = { id: 'c1', title: 'Angular Basics', price: 49 };
console.log('Card:', formatCard(card));

const createDto: CreateCourseDto = {
  title: 'New Course',
  price: 29,
  contentUrl: 'https://example.com',
  published: false,
};
console.log('Create DTO keys:', Object.keys(createDto).join(','));

const students = [
  { name: 'alice', score: 95 },
  { name: 'bob', score: 82 },
  { name: 'charlie', score: 78 },
];
const scoreMap: ScoreMap = buildScoreMap(students);
Object.entries(scoreMap).forEach(([name, score]) => console.log(`${name}: ${score}`));
