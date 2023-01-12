So far, we have seen how to create strings
using double quotes and single quotes.
In this chapter,
we will be using backticks `` ` ``
to create strings.
Such strings created using backticks
are called **template strings**
or **template literals**.

Backtick `` ` `` can be found
above the tab key on most keyboards.

<codeblock language="javascript" type="lesson">
<code>
// Template string should not be used for creating normal strings
console.log(`Hello, I am a software developer.`);

// Template string is used here to escape the double quotes used within the string
console.log(`Hello, I am a "software developer".`);

const name = `My name is "Renu Sen"`;
console.log(name);
</code>
</codeblock>

Backticks should be used
to create a string
only when there is a need to
escape double quotes in the string,
when creating multi-line strings
or
for using string interpolation.

We'll learn about string interpolation
and
creating multi-line strings
in the rest of this chapter.

We can have multiple lines
in a template string,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const itemList = `Fruits:
  Apple
  Mango
  Banana
  Orange
`;

console.log(itemList);
</code>
</codeblock>

We can insert
the value of variables
into a template string
using the `${}` notation,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const firstNum = 2;
const secondNum = 3;
const result = firstNum + secondNum;

console.log(`Adding ${firstNum} and ${secondNum} gives ${result}`);
</code>
</codeblock>

Inserting values from variables
into template strings
using the `${}` notation
is called **string interpolation**.

String interpolation should be used
for joining strings
instead of using the `+` operator.
For example, if we want to join
two strings with a space in between,
then we can do it like so:

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Sam";
const lastName = "Smith";

// We don't need to do: firstName + " " + lastName, anymore.
const fullName = `${firstName} ${lastName}`;

console.log(fullName);
</code>
</codeblock>

String interpolation can
also be used to insert
the value of an expression
into a template string
using the `${}` notation.

<codeblock language="javascript" type="lesson">
<code>
const totalIncome = 60000;
const totalExpense = 36000;

console.log(`Your balance is ${totalIncome - totalExpense}`);
</code>
</codeblock>

Looking at all the above benefits of using backticks `` ` ``,
we will continue to use it across academy.
