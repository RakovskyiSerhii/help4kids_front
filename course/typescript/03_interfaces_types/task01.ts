// Lesson 03 / Task 01 — Define interfaces
//
// Run: npx tsx 03_interfaces_types/task01.ts
//
// Expected output (exact):
// user-1 | serhii@example.com | Serhii Rakovskyi
// Token: abc123 (readonly)
// Role: admin
// Role: user
// -----------------------------------------------

// TODO 1: Define an interface `User` with:
//         - id: string (required)
//         - email: string (required)
//         - firstName: string (required)
//         - lastName: string (required)
//         - readonly token: string (cannot be changed after creation)
//         - role: optional string


// TODO 2: Write a function `formatUser` that takes a `User` and returns
//         a string formatted as: "<id> | <email> | <firstName> <lastName>"
//         Return type must be explicit.


// TODO 3: Write a function `getRole` that takes a `User` and returns
//         the role if present, or 'user' as the default.
//         Return type: string.
//         Use `??` for the default.


// --- DO NOT EDIT BELOW THIS LINE ---
const adminUser: User = {
  id: 'user-1',
  email: 'serhii@example.com',
  firstName: 'Serhii',
  lastName: 'Rakovskyi',
  token: 'abc123',
  role: 'admin',
};

const regularUser: User = {
  id: 'user-2',
  email: 'bob@example.com',
  firstName: 'Bob',
  lastName: 'Smith',
  token: 'xyz789',
};

console.log(formatUser(adminUser));
console.log(`Token: ${adminUser.token} (readonly)`);
console.log(`Role: ${getRole(adminUser)}`);
console.log(`Role: ${getRole(regularUser)}`);
