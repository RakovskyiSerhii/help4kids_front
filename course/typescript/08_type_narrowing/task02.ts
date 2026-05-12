// Lesson 08 / Task 02 — Discriminated unions
//
// Run: npx tsx 08_type_narrowing/task02.ts
//
// Expected output (exact):
// Circle area: 78.54
// Rectangle area: 24.00
// Triangle area: 6.00
// -----------------------------------------------

// TODO 1: Define a discriminated union type `Shape` with three variants:
//         - { kind: 'circle';    radius: number }
//         - { kind: 'rectangle'; width: number; height: number }
//         - { kind: 'triangle';  base: number; height: number }
//
//         The `kind` field is the discriminant — it must be a string literal, not `string`.


// TODO 2: Write a function `area` that takes a `Shape` and returns a number.
//         Use a switch on `shape.kind`.
//         Formulas:
//           circle:    π * r²
//           rectangle: w * h
//           triangle:  0.5 * b * h
//
//         Add an exhaustiveness check using `never` as the default case.
//         Return type: number.


// --- DO NOT EDIT BELOW THIS LINE ---
const shapes: Shape[] = [
  { kind: 'circle', radius: 5 },
  { kind: 'rectangle', width: 4, height: 6 },
  { kind: 'triangle', base: 4, height: 3 },
];

const labels: Record<Shape['kind'], string> = {
  circle: 'Circle',
  rectangle: 'Rectangle',
  triangle: 'Triangle',
};

shapes.forEach(s => {
  console.log(`${labels[s.kind]} area: ${area(s).toFixed(2)}`);
});
