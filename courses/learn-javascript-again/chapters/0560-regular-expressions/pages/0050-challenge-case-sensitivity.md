Create a regex pattern to match the phrase
`Quick brown` in the provided string.

The match should be case insensitive.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string= "The quick brown fox jumps over the lazy dog.";

const regex= ;

console.log(regex.test(string));
</code>
<solution>
const string= "The quick brown fox jumps over the lazy dog.";

const regex= /Quick brown/i;

console.log(regex.test(string));
</solution>
</codeblock>
