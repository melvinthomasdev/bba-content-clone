When we declare a new variable,
there are certain rules
we need to follow for
the name of the variable:

1. The name should either start
with an alphabet or an underscore, i.e., `_`.

<codeblock language="javascript" type="lesson">
<code>
const validVariableName = 120;
console.log(validVariableName);

let _validVariableName = 130;
console.log(_validVariableName);

const 0invalidVariableName = 140; // This will show an error
console.log(0invalidVariableName);
</code>
</codeblock>

In the example given above,
`0invalidVariableName`
is not a valid variable name
because it starts with a number.
You can comment out the last
two lines in the example given above
to run the code without errors.

2\. The rest of the name can only contain
alphabets, numbers and underscores.

<codeblock language="javascript" type="lesson">
<code>
const validVariableName_1 = 150;
console.log(validVariableName_1);

let invalid-variable-name = 160; // This will show an error
console.log(invalid-variable-name);
</code>
</codeblock>

In the example given above,
`invalid-variable-name`
is not a valid variable name
because the name contains `-`.

3\. A reserved keyword cannot be used
as a variable name.
For example, `let` is a keyword
used to declare variables.
We cannot declare a variable
with the name `let`.

<codeblock language="javascript" type="lesson">
<code>
const let = 170; // This will show an error
console.log(let);
</code>
</codeblock>

Note that variable names are
case-sensitive.
Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const noOfBurgers = 170;

console.log(noOfBurgers);

console.log(noofburgers); // This will show an error
</code>
</codeblock>

In the above example,
we get an error that says
**"noofburgers is not defined"**.
This is because we declared a variable
with the name `noOfBurgers`,
which is not the same as `noofburgers`.

We can have two variables with the names
`noOfBurgers` and `noofburgers`.

<codeblock language="javascript" type="lesson">
<code>
const noOfBurgers = 170;
console.log(noOfBurgers);

const noofburgers = 12;
console.log(noofburgers);
</code>
</codeblock>

Let's take a look at another example:

<codeblock language="javascript" type="lesson">
<code>
const lengthOfBox = 120;
console.log(lengthOfBox);
</code>
</codeblock>

In the example given above,
we use `lengthOfBox`
without spaces between the words
because `length of box`
is not a valid name.
Variable names cannot contain spaces.

Instead, we write all the words
together without spaces.
To distinguish each word,
we capitalize the first alphabet
of all the words,
except for the first word.
This is known as **camelCase**.

We will be naming variables
using the camelCase
in all the JavaScript courses.
Here are some other examples
of names using camelCase -
`firstName`, `lastName`,
`temperatureInCelsius`,
`fruitsWithRedColor`.