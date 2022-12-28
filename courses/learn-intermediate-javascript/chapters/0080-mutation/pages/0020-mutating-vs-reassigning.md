Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Sam",
  age: 32,
};

user.name = "Oliver";
console.log(user);
</code>
</codeblock>

In the example given above,
we are mutating the `user` object
by changing the value of
the `name` property.

Note that,
even though we declared
the `user` variable using
the `const` keyword,
we can mutate the object.

However, we cannot **reassign**
a variable declared
using the `const` keyword.

It is possible to both
mutate and reassign
variables declared using
the `let` keyword:

<codeblock language="javascript" type="lesson">
<code>
let user = {
  name: "Sam",
  age: 32,
};

// Reassigning user with another object
user = {
  name: "Oliver",
  age: 24,
};

console.log(user);

const bird = {
  name: "Parrot",
  canFly: true,
};

// Reassigning bird with another object
// This will show an error
bird = {
  name: "Penguin",
  canFly: false,
};

console.log(bird);
</code>
</codeblock>

In the example above,

- We first declare the `user` variable
  using the `let` keyword
  and
  assign it an object -
  `{ name: "Sam", age: 32 };`.

- We then **reassign** `user`
  with another object -
  `{ name: "Oliver", age: 24 };`.
  This is possible because the `user`
  variable was declared using `let`.

- The `bird` variable was declared
  using the `const` keyword
  and
  an object was assigned to it -
  `{ name: "Parrot", canFly: true };`.

- We then **reassign** `bird`
  with another object -
  `{ name: "Penguin", canFly: false };`.
  This will show an error because
  we cannot reassign a variable
  declared using the `const` keyword.

The same concepts apply to arrays
and
other composite data types.

<codeblock language="javascript" type="lesson">
<code>
let fruits = ["Apple", "Banana", "Watermelon"];

// Reassigning fruits with another array
fruits = ["Mango", "Grapes", "Strawberry"];

console.log(fruits);

const birds = [ "Parrot", "Sparrow", "Cuckoo"];

// Reassigning bird with another object
// This will show an error
birds = [ "Penguin", "Duck", "Ostrich"];

console.log(birds);
</code>
</codeblock>