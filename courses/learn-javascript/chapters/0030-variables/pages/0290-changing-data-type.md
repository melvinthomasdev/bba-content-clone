Once a variable is given a name
and
assigned a value,
we need to make sure that we don't
later assign it a value with
a different data type.

<codeblock language="javascript" type="lesson">
<code>
let lengthOfBox = 120;
console.log(lengthOfBox);

lengthOfBox = "120cm";
console.log(lengthOfBox);

console.log("Length of box in meters");
console.log(lengthOfBox * 100);
</code>
</codeblock>

In the example given above:

- We declare a variable `lengthOfBox`
  and
  assign the value `120` of type number.

- Later we change the value
  of `lengthOfBox` to `"120cm"`,
  which is of the type string.

- We get the output `NaN`,
  when we performed
  the operation `lengthOfBox * 100`
  because we tried to
  multiply a string with a number.
  We will learn about `NaN` in another section.

Such confusion can occur
when we are working in a team.
Someone other than the person
who originally wrote the code
might look at the variable declaration
`let lengthOfBox = 120`
and
assume that the value of `lengthOfBox`
will always be a number.
Hence, they might add more
code under the same assumption
without realizing that
the data type was later changed
somewhere in the code,
which will have a negative impact
on the program/application.

We can rewrite the above example
as shown below,
to avoid such confusions:

<codeblock language="javascript" type="lesson">
<code>
const lengthOfBox = 120;
console.log(lengthOfBox);

const lengthOfBoxWithUnit = "120cm";
console.log(lengthOfBoxWithUnit);

console.log("Length of box in meters");
console.log(lengthOfBox * 100);
</code>
</codeblock>