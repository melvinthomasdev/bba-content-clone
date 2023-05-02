Previously, we learned that when
we create a shallow copy of an object,
we are simply copying the address of
the memory location of where
the object's data is stored.

In this chapter we are going to create
a deep copy of an object.
This means that there will be two
different memory locations that
contains the same data, both of 
which can be updated independently.

We can use the spread operator - `...`
to create a deep copy of an object.

Let's take a look at an example:
<codeblock language="javascript" type="lesson">
<code>
const user = { name: "Sam" };

const userCopy = { ...user };
userCopy.name = "Oliver";

console.log(user.name);
console.log(userCopy.name);
</code>
</codeblock>

In the example given above:

- We store `{ name: "Sam" }` in a memory location
  and
  assign the address of that location to `user`.

- `{ ...user }` creates another object
  that contains the same key-value pairs of `user`.
  In other words, it creates a copy
  of `{ name: "Sam" }`

- `userCopy = { ...user }` stores a copy of
  the value of `user`,
  i.e., `{ name: "Sam" }`,
  in another memory location
  and
  assigns the address of
  that memory location to `userCopy`.

- So now, we have two memory locations
  that contains `{ name: "Sam" }`.

- Making a change to `userCopy.name` only affects `userCopy`.
  The value of `user.name` remains the same, i.e., `"Sam"`.
  This is because we are making the change to
  the address of the memory location stored in `userCopy`,
  which is different from the address of
  the memory location stored in `user`.

In the example given above,
`userCopy` is known as a
**deep copy** of `user`.

In the example given above,
we create a deep copy
using the `...` operator
and change the value of
the `name` property,
using two statements.
Practically, we can do this
in a single statement:

<codeblock language="javascript" type="lesson">
<code>
const user = { name: "Sam" };

const userCopy = {
  ...user,
  name: "Oliver",
};

console.log(user.name);
console.log(userCopy.name);
</code>
</codeblock>

Copying an array using the `...` operator
also creates a deep copy.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Banana", "Mango"];

const fruitsCopy = [...fruits];
fruitsCopy[1] = "Grapes";

console.log(fruits);
console.log(fruitsCopy);
</code>
</codeblock>