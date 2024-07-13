Create a regex pattern to find if the word **hello** (case-insensitive) exists in the the two provided strings. Complete the code by defining the **regex** variable and logging the result of match to the console in the given order.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const messageOne = "Hello, world!";
const messageTwo = "Hi, there!";

const regex = ;

</code>
<solution>
const messageOne = "Hello, world!";
const messageTwo = "Hi, there!";

const regex = /hello/i;

console.log(messageOne.match(regex));
console.log(messageTwo.match(regex));
</solution>
</codeblock>
