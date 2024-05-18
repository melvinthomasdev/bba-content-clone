Create a regex pattern to match any
word starting with `c`
and
ending with `t` in the provided strings.


<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "cat cot cut coat";
const string2 = "dog coat eat";

const regex = ;

console.log(regex.test(string1));
console.log(regex.test(string2));
</code>
<solution>
const string1 = "cat cot cut coat";
const string2 = "dog coat eat";

const regex = /c.t/;

console.log(regex.test(string1));
console.log(regex.test(string2));
</solution>
</codeblock>
