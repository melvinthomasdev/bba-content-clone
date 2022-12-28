Cloning means to make a copy of something.
In JavaScript, cloning a primitive data type
such as a number, string or boolean
is pretty straightforward.

<codeblock language="javascript" type="lesson">
<code>
let count = 10;
let countCopy = count;

count = 23;

console.log(count);
console.log(countCopy);
</code>
</codeblock>

In the example given above:

- When we declare the `count` variable,
  i.e., `let count = 10`,
  we store the value `10` in a memory location.
  Every time we use the variable `count`
  it refers to this memory location.

- When we assign `count` to `countCopy`,
  i.e., `let countCopy = count`,
  we store the value of `copy`, i.e.,`10`
  in a different memory location.
  Every time we use the variable `countCopy`
  it refers to this new memory location.

- In short, we have two memory locations
  with the same value `10`.

- When we make a change to `count`
  it does not affect the value of `countCopy`.
  That is why,
  when we changed the value of `count` to `23`,
  the value of `countCopy` remained `10`.

In JavaScript, cloning composite data types
such as objects and arrays,
is not as straightforward as
cloning primitive data types.

Look at the example given below:

<codeblock language="javascript" type="lesson">
<code>
const user = { name: "Sam" };

console.log(user.name);
</code>
</codeblock>

In the example given above,

- When we create the object `user`,
  i.e., `const user = { name: "Sam" }`,
  the object value `{ name: "Sam" }`
  is stored in a memory location.
  The address of this memory location
  is stored in `user`.

- When we use the variable `user`,
  we are not referring to
  the value `{ name: "Sam" }`,
  we are referring to the address
  of the memory location
  where that value is stored.

This means that when we clone
a composite data type,
we are cloning the address of
the memory location of where
that data is stored.
Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user = { name: "Sam" };

const userCopy = user;
userCopy.name = "Oliver";

console.log(user.name);
console.log(userCopy.name);
</code>
</codeblock>

In the example given above:

- We assign the address of where
  `{ name: "Sam" }` is stored
  to `user`.

- When we assign `user` to `userCopy`
  like `const userCopy = user`,
  we assign the address stored in `user`
  to `userCopy`.

- Hence, the change `userCopy.name = "Oliver"`
  will affect both `userCopy.name`
  as well as `user.name`.
  This is because we are making a change
  in the same memory location that is
  stored in both `user` and `userCopy`.

In the example given above,
`userCopy` is known as a
**shallow clone** of `user`.

Cloning an array using the `=` operator,
also creates a shallow clone.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Banana", "Mango"];

const fruitsCopy = fruits;
fruitsCopy[1] = "Grapes";

console.log(fruits);
console.log(fruitsCopy);
</code>
</codeblock>