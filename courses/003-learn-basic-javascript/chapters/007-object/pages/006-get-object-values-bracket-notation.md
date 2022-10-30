The dot notation works almost everywhere,
but there are some situations
in which we can not use it.
For example, using the dot operator
in the code given below
will result in an error:

<Editor lang="javascript">
<code>
let person = {
  12: "Adam",
  13: "Samantha"
};

console.log(person.12);
</code>
</Editor>

This is because,
the dot operator needs the key name
to be a proper variable name.
In JavaScript,
you can not have a variable name
start with a number.
This is why,
our code results in an error.

Now, to access the value of this property,
we need a different notation:
the **bracket notation**.

In the example given below,
we are using the bracket notation,
to read the **value** stored in the `12` **key**.

<Editor lang="javascript">
<code>
let person = {
  12: "Adam",
  13: "Samantha"
};

console.log(person[12]);
</code>
</Editor>