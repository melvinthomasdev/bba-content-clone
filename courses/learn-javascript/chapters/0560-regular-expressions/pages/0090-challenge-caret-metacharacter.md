Create a regex pattern to match
the word `hello` at the beginning
of the provided strings.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "hello world";
const string2 = "world hello";

const regex = ;

console.log(regex.test(string1));
console.log(regex.test(string2));
</code>
<solution>
const string1 = "hello world";
const string2 = "world hello";

const regex = /^hello/;

console.log(regex.test(string1));
console.log(regex.test(string2));
</solution>
</codeblock>
