// Lesson 05 / Task 02 — Inheritance with extends and override
//
// Run: npx tsx 05_classes/task02.ts
//
// Expected output (exact):
// Buddy makes a sound
// Buddy barks
// Labrador
// Whiskers meows
// -----------------------------------------------

// TODO 1: Define a class `Animal` with:
//   - public field `name: string` (use constructor shorthand)
//   - method `speak(): string` — returns '<name> makes a sound'
//   - constructor: constructor(public name: string)


// TODO 2: Define a class `Dog` that extends `Animal`:
//   - additional public field `breed: string` (use constructor shorthand)
//   - constructor takes name and breed, calls super(name)
//   - OVERRIDE `speak()`: returns '<name> barks'
//     Use the `override` keyword.


// TODO 3: Define a class `Cat` that extends `Animal`:
//   - constructor takes only name
//   - OVERRIDE `speak()`: returns '<name> meows'
//     Use the `override` keyword.


// --- DO NOT EDIT BELOW THIS LINE ---
const generic: Animal = new Animal('Buddy');
console.log(generic.speak());

const dog: Dog = new Dog('Buddy', 'Labrador');
console.log(dog.speak());
console.log(dog.breed);

const cat: Cat = new Cat('Whiskers');
console.log(cat.speak());
