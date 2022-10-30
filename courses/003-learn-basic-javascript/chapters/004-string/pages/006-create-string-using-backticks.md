We can create strings
using backticks. Backticks look like
this ` on your keyboard. You can mostly find
them above your tab key in the keyboard.

<Editor lang="javascript">
<code>
console.log(`Hello, I am a software developer.`);

const name = `My name is Renu Sen`;
console.log(name);
</code>
</Editor>

We can also use backticks to
create a multi-line string.

<Editor lang="javascript">
<code>
const itemList = `Fruits:
  Apple
  Mango
  Banana
  Orange
`;

console.log(itemList);
</code>
</Editor>

We can insert the value
of a variable to a string
using the `${}` notation.
For example:

<Editor lang="javascript">
<code>
const firstNum = 2;
const secondNum = 3;
const result = firstNum + secondNum;

console.log(`Adding ${firstNum} and ${secondNum} gives ${result}`);
</code>
</Editor>

Inserting values from variables to strings
using this method is called **string interpolation**.

From now on, in the Academy, we will be using
string interpolation over using the `+` operator
for joining strings. For example, if we want
to join two strings with an empty space in
between, then we can do it like so:

<Editor lang="javascript">
<code>
const firstName = "Sam";
const lastName = "Smith";

// We don't need to do: firstName + " " + lastName, anymore.
const fullName = `${firstName} ${lastName}`;

console.log(fullName);
</code>
</Editor>

String interpolation can
also be used to insert
the value of an expression
into a string using the `${}` notation.

<Editor lang="javascript">
<code>
const totalIncome = 60000;
const totalExpense = 36000;

console.log(`Your balance is ${totalIncome - totalExpense}`);
</code>
</Editor>