Object destructuring allows us to
copy the value of properties of objects
and
store them in other variables.

<codeblock language="javascript" type="lesson">
<code>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

const { age } = person;
console.log(`Adam's age is ${age}`);
</code>
</codeblock>

In the example given below,
the object `person` stores many properties.
We copied only the value of
the `age` property
and
assigned it to a variable named `age`.

We can extract
multiple properties from
an object at the same time.

<codeblock language="javascript" type="lesson">
<code>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

const { age, fullName, isAdmin } = person;
console.log(`${fullName} is ${age} years old. Are they an admin? ${isAdmin}.`);
</code>
</codeblock>

In the example given above,
we store each property of the object `person`
in the variables whose names
are same as that of the key
of the properties.
The value of `person.fullName`
is stored in `fullName`,
`person.age` in `age`,
and
`person.isAdmin` in `age`.

In the example given above,
note that,
the order in which the properties
are destructured `{ age, fullName, isAdmin }`
does not have to match the
order in which the properties are defined.

Do note that,
the name of the variable
we store the value of a property in,
should be same as the key
of that property.

There is a way of storing
the value of a property
in a variable whose name
is not same as the key
of that property.
We'll take a look at how
in the next chapter.
