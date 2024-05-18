Create a regex pattern to match
the phrase `quick brown`
in the provided string.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string= "The quick brown fox jumps over the lazy dog.";

const regex = ;

console.log(regex.test(string));
</code>
<solution>
const string= "The quick brown fox jumps over the lazy dog.";

const regex = /quick brown/;

console.log(regex.test(string));
</solution>
</codeblock>
