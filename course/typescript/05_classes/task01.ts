// Lesson 05 / Task 01 — Basic class
//
// Run: npx tsx 05_classes/task01.ts
//
// Expected output (exact):
// BankAccount for Serhii, balance: 1000
// Deposited 500. Balance: 1500
// Withdrew 200. Balance: 1300
// Error: Insufficient funds
// -----------------------------------------------

// TODO: Define a class `BankAccount` with:
//
//   Fields:
//   - owner: string (public, readonly — set in constructor, never changes)
//   - balance: number (private — only changed through deposit/withdraw)
//
//   Constructor shorthand: use the parameter shorthand for `owner`.
//   `balance` should default to 0 if not passed, or accept an initial balance.
//   Constructor signature: constructor(owner: string, initialBalance: number = 0)
//
//   Methods:
//   - deposit(amount: number): string
//     Adds amount to balance. Returns 'Deposited <amount>. Balance: <new balance>'
//
//   - withdraw(amount: number): string
//     If balance is sufficient: deducts and returns 'Withdrew <amount>. Balance: <new balance>'
//     If insufficient: returns 'Error: Insufficient funds'
//
//   - toString(): string
//     Returns 'BankAccount for <owner>, balance: <balance>'
//
// All methods and fields must have explicit access modifiers.
// Return types must be explicit.


// --- DO NOT EDIT BELOW THIS LINE ---
const account: BankAccount = new BankAccount('Serhii', 1000);
console.log(account.toString());
console.log(account.deposit(500));
console.log(account.withdraw(200));
console.log(account.withdraw(5000));
