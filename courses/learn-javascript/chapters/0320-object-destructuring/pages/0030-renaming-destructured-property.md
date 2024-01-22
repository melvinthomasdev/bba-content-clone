Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const fruit = {
  name: "apple",
  color: "red",
}

const animal = {
  name: "horse",
  color: "brown",
}

const { name, color } = fruit;
const { name, color } = animal;
</code>
</codeblock>

In the example given above,
we have two objects `fruit` and `animal`
with keys of the same names
`name` and `color`.
When destructuring these objects
and storing the values in separate variables
we get an error because
we cannot have two variables named `name`
as well as two variables named `color`.

We can use a colon `:` to
specify another name for the variable
in which the value of a property
from a destructured object is stored.

Let's rewrite the above example:

<codeblock language="javascript" type="lesson">
<code>
const fruit = {
  name: "apple",
  color: "red",
}

const animal = {
  name: "horse",
  color: "brown",
}

const { name: fruitName, color: fruitColor } = fruit;
const { name: animalName, color: animalColor } = animal;

console.log(`The ${animalColor} ${animalName} eats a ${fruitColor} ${fruitName}`);
</code>
</codeblock>

In the example give above:

- The value of the `name` property
  from the `fruit` object is copied
  and
  assigned to `fruitName`.

- The value of the `color` property
  from the `fruit` object is copied
  and
  assigned to `fruitColor`.

- The value of the `name` property
  from the `animal` object is copied
  and
  assigned to `animalName`.

- The value of the `color` property
  from the `animal` object is copied
  and
  assigned to `animalColor`.

The ability to rename destructured properties
is useful in cases where
the key name of an object
is not a valid variable name,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  "full-name": "Sam Smith",
}

const { "full-name" } = user;
</code>
</codeblock>

In the example given above,
we get an error because `"full-name"`
is not a valid variable name.
So we need to rename the destructured property
to a valid variable name,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  "full-name": "Sam Smith",
}

const { "full-name": fullName } = user;
console.log(fullName);
</code>
</codeblock>