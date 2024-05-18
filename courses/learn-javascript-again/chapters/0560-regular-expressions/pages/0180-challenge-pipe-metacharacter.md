Create a regex pattern to match any
string that contains either `apple`
or `banana` in the provided strings.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "apple pie";
const string2 = "banana split";
const string3 = "orange juice";
const string4 = "apple banana";

const regex = ;

console.log(regex.test(string1));
console.log(regex.test(string2));
console.log(regex.test(string3));
console.log(regex.test(string4));
</code>
<solution>
const string1 = "apple pie";
const string2 = "banana split";
const string3 = "orange juice";
const string4 = "apple banana";

const regex = /apple|banana/;

console.log(regex.test(string1));
console.log(regex.test(string2));
console.log(regex.test(string3));
console.log(regex.test(string4));
</solution>
</codeblock>
