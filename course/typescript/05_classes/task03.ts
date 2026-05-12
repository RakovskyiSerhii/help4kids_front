// Lesson 05 / Task 03 — Abstract classes and implements
//
// Run: npx tsx 05_classes/task03.ts
//
// Expected output (exact):
// Circle area: 78.54
// Rectangle area: 24.00
// Circle: Area is 78.54
// Rectangle: Area is 24.00
// Serialized: {"type":"circle","radius":5}
// -----------------------------------------------

// TODO 1: Define an abstract class `Shape` with:
//   - abstract method `area(): number`
//   - concrete method `describe(): string` — returns 'Area is <area rounded to 2 decimals>'
//     (use toFixed(2))


// TODO 2: Define an interface `Serializable` with:
//   - method `serialize(): string`


// TODO 3: Define class `Circle` that EXTENDS `Shape` AND IMPLEMENTS `Serializable`:
//   - constructor takes `radius: number` (private, readonly, shorthand)
//   - implements `area()`: returns π * r²  (use Math.PI and ** operator)
//   - implements `serialize()`: returns JSON string { type: 'circle', radius: <r> }
//     Use JSON.stringify({ type: 'circle', radius: this.radius })


// TODO 4: Define class `Rectangle` that EXTENDS `Shape`:
//   - constructor takes `width: number` and `height: number` (private, readonly, shorthand)
//   - implements `area()`: returns width * height


// --- DO NOT EDIT BELOW THIS LINE ---
const circle: Circle = new Circle(5);
const rect: Rectangle = new Rectangle(4, 6);

console.log(`Circle area: ${circle.area().toFixed(2)}`);
console.log(`Rectangle area: ${rect.area().toFixed(2)}`);
console.log(`Circle: ${circle.describe()}`);
console.log(`Rectangle: ${rect.describe()}`);
console.log(`Serialized: ${circle.serialize()}`);
