When we declare a new variable,
we can give it any name that we desire.
A commonly seen bad practice is to
name the variable with just one character.
This is usually done with the intention
of saving time while writing code.
Consider the example given below:

<codeblock language="javascript" type="lesson">
<code>
const l = 120;
console.log(l);
</code>
</codeblock>

In the example given above,
let's say we are storing
the length of a box
in the variable `l`.
It might make sense to the person
who wrote the code,
but it will be confusing for
someone else who is reading the code,
because `l` can mean anything to them.

While using variable names
with just one character
or
an abbreviation
might save time for the developer,
it will be a waste of time for
people who read the code
and
do not know what the variable name means.

It is a best practice to
give variables names
that describe the value
that is assigned to them.

So a better name for the `l` variable
in the example above would be
`length` or `lengthOfBox`.

<codeblock language="javascript" type="lesson">
<code>
const lengthOfBox = 120;
console.log(lengthOfBox);
</code>
</codeblock>

In the example given above,
we use the name `lengthOfBox`
because that name makes the purpose
of that variable clear
to someone other than the developer
who is reading that code.

Let's say we need to store the value
of the length of the box along with
the unit of measurement, i.e., "120cm".
Here, the data type is a string.
A name like `lengthString` or `lengthAsString`
does not provide a good description
of the value that will be stored in the variable
and
should be avoided.
The name also does not make sense to someone
who is not familiar
with technical words like **string**.

Instead, we can use the name
shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const lengthOfBoxWithUnit = "120cm";
console.log(lengthOfBoxWithUnit);
</code>
</codeblock>

In the above example,
we create a variable
to store the string `"120cm"`
with the name `lengthOfBoxWithUnit`.

The name `lengthOfBoxWithUnit` achieves two things:

1. `lengthOfBox` makes it clear that
   this variable store the length of a box.

2. `WithUnit` gives the idea that,
   the value this variable holds
   contains the length
   and
   the unit of measurement,
   which is only possible if
   the data type is string.
