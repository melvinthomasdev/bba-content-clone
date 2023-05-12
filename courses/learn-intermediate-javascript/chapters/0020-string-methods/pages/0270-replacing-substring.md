The `replace()` method is
used to replace a word with
another word in a string.

Let us take a look at an example:

<codeblock language="javascript" type="lesson">
<code>
"I feel like the king of the world".replace("world", "universe");
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

"I look fat".replace("fat", makeUpperCase("fat"));
</code>
</codeblock>

In this code-block, we can see
that replace even accepts a
function as a second parameter.
What this function returns
replaces `fat`.

Let's take a look at a few more
applications of `replace()`
method.

<codeblock language="javascript" type="lesson">
<code>
// Variable which holds a string as it's value
const string = "I love ice-cream"

string.replace("love", "hate");

// Using anonymous arrow function as a second parameter
"Come fly with me".replace("fly", substring => substring.toUpperCase());

// Replacing with a number
"I had two chocolates".replace("two", 2);
</code>
</codeblock>
