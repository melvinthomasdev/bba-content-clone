The `replace()` method is
used to replace a word with
another word in a string.

Let us take a look at an example:

<codeblock language="javascript" type="lesson">
<code>
const statement = "I feel like the king of the world!";
console.log(statement);

const updatedStatement = statement.replace("world", "universe");
console.log(updatedStatement);
</code>
</codeblock>

As we can see in the code
above, replace method accepts
**2** parameters.

First is the word that needs
to be replaced. This word is
part of the **string** on which
we have used the `replace()`
method.

Second parameter is the word
which will replace the the
**first parameter** word
we provided from the **string**.

The syntax to use replace method
is as follows:
`string.replace(value-to-be-replaced, value-which-replaces)`

Let us take a look at another example:
<codeblock language="javascript" type="lesson">
<code>
const makeUpperCase = subString => {
  return subString.toUpperCase();
};

const currentMood = "I am happy.";
console.log(currentMood);

const updatedMood = currentMood.replace("happy", makeUpperCase("happy"));
console.log(updatedMood);
</code>
</codeblock>

In this code-block, we can see
that replace even accepts a
function as a second parameter.
What this function returns
replaces `happy`.

Let's take a look at a few more
applications of `replace()`
method.

<codeblock language="javascript" type="lesson">
<code>
// Variable which holds a string as its value
const statementOne = "I like ice-cream.";
console.log(statementOne);

const updatedStatementOne = statementOne.replace("like", "love");
console.log(updatedStatementOne);


// Using anonymous arrow function as a second parameter
const statementTwo = "Come fly with me.";
console.log(statementTwo);

const updatedStatementTwo = statementTwo.replace("fly", substring => substring.toUpperCase());
console.log(updatedStatementTwo);

// Replacing with a number
const statementThree = "I had two chocolates.";
console.log(statementThree);

const updatedStatementThree = statementThree.replace("two", 2);
console.log(updatedStatementThree);
</code>
</codeblock>
