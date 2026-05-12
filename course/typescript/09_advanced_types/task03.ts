// Lesson 09 / Task 03 — Template literal types and intersection types
//
// Run: npx tsx 09_advanced_types/task03.ts
//
// Expected output (exact):
// margin-top
// margin-bottom
// margin-left
// margin-right
// Full name: Serhii Rakovskyi | admin | serhii@example.com
// -----------------------------------------------

// TODO 1: Define a type `Side` that is a union of: 'top' | 'bottom' | 'left' | 'right'


// TODO 2: Define a template literal type `MarginProp` that is `margin-${Side}`.
//         It should resolve to:
//         'margin-top' | 'margin-bottom' | 'margin-left' | 'margin-right'


// TODO 3: Write a function `allMargins` that returns all four MarginProp values
//         as an array. Return type: MarginProp[].
//         Hardcode the four values — they are a finite set.


// TODO 4: Define two interfaces:
//         `Named`   — { firstName: string; lastName: string }
//         `Roled`   — { role: string }
//         `Contacted` — { email: string }
//
//         Define an intersection type `FullUser` = Named & Roled & Contacted.
//         Do NOT rewrite all fields in a new interface — use &.


// TODO 5: Write a function `describeFullUser` that takes a `FullUser` and returns:
//         'Full name: <firstName> <lastName> | <role> | <email>'
//         Return type: string.


// --- DO NOT EDIT BELOW THIS LINE ---
allMargins().forEach(m => console.log(m));

const admin: FullUser = {
  firstName: 'Serhii',
  lastName: 'Rakovskyi',
  role: 'admin',
  email: 'serhii@example.com',
};
console.log(describeFullUser(admin));
