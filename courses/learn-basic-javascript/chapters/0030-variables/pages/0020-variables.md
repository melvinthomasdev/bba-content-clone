Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
console.log("Length in centimeters:");
console.log(120);

console.log("Length in meters:");
console.log(120 / 100);

console.log("Length in kilometers:");
console.log(120 / 100000);
</code>
</codeblock>

In the above example,
we repeatedly use the value `120`
in three different places.
Let's say we need to replace `120`
with the value `123`,
we would have to go through
the whole code
and
replace all occurrences of
`120` with `123`.
This will become a tedious task
for a large code.

Here we can use a **variable**
to store the value `120`
that is repeatedly used,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const length = 120;

console.log("Length in centimeters:");
console.log(length);

console.log("Length in meters:");
console.log(length / 100);

console.log("Length in kilometers:");
console.log(length / 100000);
</code>
</codeblock>

In the above example:

- `const length = 120` stores the value `120`
  in a variable named `length`.
  We say that the value `120`
  is assigned to the variable `length`.

- Once the variable is created,
  we can use the variable name,
  i.e., `length` in the example above,
  wherever we need to use the value
  that is assigned to it.

- `const` is a keyword
  used to create a variable.
  We will talk about what `const`
  stands for in an upcoming chapter.
