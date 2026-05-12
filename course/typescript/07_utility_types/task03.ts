// Lesson 07 / Task 03 — ReturnType, Parameters, combining utilities
//
// Run: npx tsx 07_utility_types/task03.ts
//
// Expected output (exact):
// Param count: 2
// Patch keys: title,price
// Mapped: [2,4,6]
// -----------------------------------------------

interface Product {
  id: string;
  title: string;
  price: number;
  stock: number;
  category: string;
}

// This function is given — do not modify it.
function fetchProduct(id: string, token: string): Promise<Product> {
  return Promise.resolve({ id, title: 'Demo', price: 0, stock: 0, category: 'none', token } as unknown as Product);
}

// TODO 1: Declare a type `FetchParams` that equals the parameter types of `fetchProduct`
//         using `Parameters<typeof fetchProduct>`.
//         It should be a tuple [string, string].
//         Do NOT write [string, string] manually.


// TODO 2: Declare a type `PatchProductDto` that allows updating only
//         `title` and `price`, and both fields optional.
//         Use `Partial<Pick<Product, ...>>` — do NOT write the type manually.


// TODO 3: Write a function `applyPatch` that takes:
//         - product: Product
//         - patch: PatchProductDto
//         Returns a new Product with the patch applied. Return type: Product.


// TODO 4: Write a generic function `mapArray` that takes:
//         - items: T[]
//         - fn: (item: T) => U
//         Returns U[]
//         This is essentially typing Array.prototype.map yourself.
//         Both T and U must be type parameters in the function signature.
//         Return type: U[]


// --- DO NOT EDIT BELOW THIS LINE ---
const params: FetchParams = ['product-1', 'my-token'];
console.log('Param count:', params.length);

const patch: PatchProductDto = { title: 'Updated', price: 99 };
console.log('Patch keys:', Object.keys(patch).join(','));

const numbers: number[] = [1, 2, 3];
const doubled: number[] = mapArray(numbers, (n: number): number => n * 2);
console.log('Mapped:', JSON.stringify(doubled));
