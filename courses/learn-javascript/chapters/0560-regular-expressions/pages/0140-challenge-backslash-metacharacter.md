Create a regex pattern to match any string that contains a literal comma , in the provided inputs.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "apple, banana";
const string2 = "orange/apple";

const regex = ;

console.log(regex.test(string1));
console.log(regex.test(string2));
</code>
<solution>
const string1 = "apple, banana";
const string2 = "orange/apple";

const regex = /\,/;

console.log(regex.test(string1));
console.log(regex.test(string2));
</solution>
</codeblock>
