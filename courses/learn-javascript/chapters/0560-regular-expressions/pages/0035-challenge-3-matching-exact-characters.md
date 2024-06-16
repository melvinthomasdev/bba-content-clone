Create a regex pattern to find if the word **apple** exists in the two provided strings. Complete the code by defining the **regex** variable and logging the result of the match to the console in the given order.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const messageOne = "An apple a day keeps the doctor away.";
const messageTwo = "I like oranges.";

const regex = ;

</code>
<solution>
const messageOne = "An apple a day keeps the doctor away.";
const messageTwo = "I like oranges.";

const regex = /apple/;

console.log(messageOne.match(regex));
console.log(messageTwo.match(regex));
</solution>
</codeblock>
