Create a regex pattern to match the phrase **"quick brown"** in the provided string. You should complete the code by defining the **regex** variable and then log either true or false to the console based on checking the pattern in the string.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string = "The quick brown fox jumps over the lazy dog.";

const regex = ;

</code>
<solution>
const string = "The quick brown fox jumps over the lazy dog.";

const regex = /quick brown/;

console.log(regex.test(string));
</solution>
</codeblock>