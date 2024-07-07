Create a regex pattern to match
any string that contains an uppercase
letter `A-Z` in the provided strings.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "Hello";
const string2 = "world";
const string3 = "Example";
const string4 = "orange";
const string5 = "Apple";

const regex = ;

console.log(regex.test(string1));
console.log(regex.test(string2));
console.log(regex.test(string3));
console.log(regex.test(string4));
console.log(regex.test(string5));
</code>
<solution>
const string1 = "Hello";
const string2 = "world";
const string3 = "Example";
const string4 = "orange";
const string5 = "Apple";

const regex = /[A-Z]/;

console.log(regex.test(string1));
console.log(regex.test(string2));
console.log(regex.test(string3));
console.log(regex.test(string4));
console.log(regex.test(string5));
</solution>
</codeblock>
