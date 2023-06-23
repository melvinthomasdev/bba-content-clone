Given a sentence as input, remove all vowels from it.

1. Return string without vowels

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const removeVowels = str => {
  // your code here
};
</code>

<solution>
/* solution using regex
const removeVowelsRegex = str => str.replace(/[aeiou]/gi, '')
*/

// solution without regex
const removeVowels = str => str.split("").filter(filterVowels).join("")

const vowels = ["a","e","i","o","u"];

const filterVowels = char => !vowels.includes(char || char.toLowerCase());
</solution>

<testcases>
<caller>
console.log(removeVowels(str));
</caller>
<testcase>
<i>
const str = "Built by team of BigBinary";
</i>
</testcase>
<testcase>
<i>
const str = "Hello World";
</i>
</testcase>
<testcase>
<i>
const str = "The weather is good";
</i>
</testcase>
</testcases>
</codeblock>