Create a regex pattern to match the phrase **"saves nine"** in the provided string.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string = "A stitch in time saves nine.";

const regex = ;

console.log(regex.test(string));
</code>
<solution>
const string = "A stitch in time saves nine.";

const regex = /saves nine/;

console.log(regex.test(string));
</solution>
</codeblock>
