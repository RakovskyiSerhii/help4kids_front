// Lesson 03 / Task 02 — Interface extension
//
// Run: npx tsx 03_interfaces_types/task02.ts
//
// Expected output (exact):
// entity-1 created at 2024-01-01
// Serhii | admin | permissions: read,write,delete
// -----------------------------------------------

// TODO 1: Define an interface `Entity` with:
//         - id: string
//         - createdAt: string


// TODO 2: Define an interface `User` that EXTENDS `Entity` and adds:
//         - name: string
//         - role: string


// TODO 3: Define an interface `AdminUser` that EXTENDS `User` and adds:
//         - permissions: string[]


// TODO 4: Write a function `describeEntity` that takes an `Entity` and
//         returns '<id> created at <createdAt>'
//         Return type: string.


// TODO 5: Write a function `describeAdmin` that takes an `AdminUser` and
//         returns '<name> | <role> | permissions: <permissions joined by comma>'
//         Return type: string.


// --- DO NOT EDIT BELOW THIS LINE ---
const admin: AdminUser = {
  id: 'entity-1',
  createdAt: '2024-01-01',
  name: 'Serhii',
  role: 'admin',
  permissions: ['read', 'write', 'delete'],
};

console.log(describeEntity(admin));  // AdminUser satisfies Entity — no cast needed
console.log(describeAdmin(admin));
