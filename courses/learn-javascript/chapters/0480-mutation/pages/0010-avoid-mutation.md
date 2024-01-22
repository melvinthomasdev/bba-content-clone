Mutation means to change something.
Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Banana", "Mango"];
fruits[1] = "Grapes";
console.log(fruits);

const user = {
  name: "Sam",
  age: 32,
};
user.name = "Oliver";
console.log(user);
</code>
</codeblock>

In the example given above,
we are mutating both
the `fruits` array by changing
the value of an element
and
the `user` object by changing
the value of a property.

Mutating objects and arrays
can lead to unwanted outputs.
Let's say we have an array `fruits`
that contains names of some fruits.
We want to temporarily sort the array
and
display the sorted array.
Then we want to display the array
in it's original order.

<codeblock language="javascript" type="lesson">
<code>
const printSortedList = list => {
  list.sort();
  console.log("List in sorted alphabetically:");
  console.log(list)
}

const fruits = ["Mango", "Banana", "Apple"];
printSortedList(fruits);

console.log("List in original order:");
console.log(fruits);
</code>
</codeblock>

In the example given above:

- We are displaying the `fruits` array
  after sorting it using the `printSortedList` function.
  We pass `fruits` as the argument for
  the `list` parameter in the `printSortedList` function.

- Inside the `printSortedList` function,
  we use `list.sort()` to sort the array
  and
  then display it using `console.log()`.
  Here, we are mutating the `list` array
  when we use `list.sort()`.
  Since `list` is a reference to
  the `fruits` array,
  we are mutating the `fruits` array as well.

- When we display the `fruits` array after
  `printSortedList(fruits)`,
  we get the sorted array,
  even though our intention is to show
  the list in it's original order.

To prevent such unwanted outputs,
it is a good practice to avoid using
methods that mutate arrays and objects.
Methods such as `sort`, `splice`, `pop`, and `push`
mutates the array it is invoked on.
Similarly, `Object.assign()` mutates the object
passed as the first argument to it.

There are ways we can use these methods
or achieve the same thing
that these methods achieve
without mutating the original array or object.

Let's take sorting an array for example:

<codeblock language="javascript" type="lesson">
<code>
const printSortedList = list => {
  const sortedList = [...list].sort();
  console.log("List in sorted alphabetically:");
  console.log(sortedList);
}

const fruits = ["Mango", "Banana", "Apple"];
printSortedList(fruits);

console.log("List in original order:");
console.log(fruits);
</code>
</codeblock>

In the example given above,

- `[...list]` creates a copy of the `list` array.

- `[...list].sort()` sorts the copy of
  the `list` array that was created.
  This way the original array - `list`
  remains unchanged,
  therefore `fruits` also remains unchanged.

Similarly, there is a way to add
a new property to an object,
apart from using `Object.assign()`.

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  name: "Sam Smith",
  age: 32,
};

const user2 = {
  name: "Oliver Smith",
  age: 24,
};

const addDefaultPropsUsingAssign = person => {
  Object.assign(person, {
    role: "standard",
    password: "123456",
  });
}

const addDefaultPropsUsingSpread = person => ({
  ...person,
  role: "standard",
  password: "123456",
});

addDefaultPropsUsingAssign(user1);
console.log(user1);

const updatedUser2 = addDefaultPropsUsingSpread(user2);
console.log(user2);
console.log(updatedUser2);
</code>
</codeblock>

In the example given above,
we have two functions:

- `addDefaultPropsUsingAssign` -
  adds the `role` and `password`
  properties to the `person` parameter
  using `Object.assign()`.

- `addDefaultPropsUsingSpread` -
  creates a new object,
  that contains properties
  of the `person` parameter
  as well as the `role` and `password`
  properties using `...` operator.

Both functions perform the same operation,
i.e., add the `role` and `password` properties
to an object.

`addDefaultPropsUsingAssign`
mutates the object that is
passed as argument to it.
So `addDefaultPropsUsingAssign(user1)`
mutates `user1` itself.

`addDefaultPropsUsingAssign`
creates another object
that contains the properties
of the object passed as argument
and
adds the new properties.
Hence, when we perform
`const updatedUser2 = addDefaultPropsUsingAssign(user2)`,
`user2` remains unchanged
and
we assign the new object with
the added properties in `updatedUser2`.

**Mutation of objects and arrays should be avoided at all cost.**

Only if we come across a situation where
we absolutely have no other choice,
should we mutate an object or an array.
