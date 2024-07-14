Create a regex pattern to match
the word `strawberry` at the end
of the provided strings.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const string1 = "strawberry banana";
const string2 = "apple strawberry";

const regex = ;

console.log(regex.test(string1));
console.log(regex.test(string2));
</code>
<solution>
const string1 = "strawberry banana";
const string2 = "apple strawberry";

const regex = /strawberry$/;

console.log(regex.test(string1));
console.log(regex.test(string2));
</solution>
</codeblock>
