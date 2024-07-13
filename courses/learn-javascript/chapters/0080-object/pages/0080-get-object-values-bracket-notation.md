The dot notation works almost everywhere,
but there are some situations
in which we can not use it.
For example, using the dot operator
in the code given below
will result in an error:

<codeblock language="javascript" type="lesson">
<code>
const person = {
  12: "Adam",
  13: "Samantha"
};

console.log(person.12);
</code>
</codeblock>

This is because
the dot operator needs the key name
to be a proper variable name.
In JavaScript,
you can not have a variable name
that starts with a number.
This is why
our code results in an error.

Now, to access the value of
such properties,
we need a different notation:
the **bracket notation**.

In the example given below,
we are using the bracket notation,
to read the **value** stored in the `12` **key**.

<codeblock language="javascript" type="lesson">
<code>
const person = {
  12: "Adam",
  13: "Samantha"
};

console.log(person[12]);
</code>
</codeblock>

Here's another example where
we are using bracket notation
to read the **value** stored in
the `project-lead` key:

<codeblock language="javascript" type="lesson">
<code>
const project = {
  "project-lead": "Adam",
  developer: "Samantha"
};

console.log(project["project-lead"]);
</code>
</codeblock>

In the above example,
we could not have used `project.project-lead`
because `project-lead` is not
a proper variable name
because it contains the `-` character.

We can also use variables inside
the bracket notation.
Look at the example below.

<codeblock language="javascript" type="lesson">
<code>
const project = {
  "project-lead": "Adam",
  developer: "Samantha"
};

const keyName = "project-lead"

console.log(project[keyName]); // Same as console.log(project["project-lead"]);
</code>
</codeblock>

In the example given above,
the **key** name `project-lead`
from the `project` object
is stored inside a variable `keyName`.
