Create a regex pattern to match
any string that contains a word
starting with `cat` followed by
any character except `s`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "cat";
const string2 = "cats";
const string3 = "catch";
const string4 = "category";

const regex = ;

console.log(regex.test(string1));
console.log(regex.test(string2));
console.log(regex.test(string3));
console.log(regex.test(string4));
</code>
<solution>
const string1 = "cat";
const string2 = "cats";
const string3 = "catch";
const string4 = "category";

const regex = /cat[^s]/;

console.log(regex.test(string1));
console.log(regex.test(string2));
console.log(regex.test(string3));
console.log(regex.test(string4));
</solution>
</codeblock>
