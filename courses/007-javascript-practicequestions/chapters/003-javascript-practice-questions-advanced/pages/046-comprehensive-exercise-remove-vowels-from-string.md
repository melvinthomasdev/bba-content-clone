Given a sentence as input, remove all vowels from the it.

1. Return string without vowels

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const removeVowels = (str) => {
  // your code here
};
</code>

<solution>
/* solution using regex
const removeVowelsRegex = (str) => {
    return str.replace(/[aeiou]/gi, '')
} */

// solution without regex
const removeVowels = (str) => {
  const vowels = new Set(["a", "e", "i", "o", "u"]);
  const strArr = [...str.toLowerCase()];
  const result = strArr.map((char, idx) => {
    if (vowels.has(char)) {
      return (strArr[idx] = "");
    } else return (strArr[idx] = char);
  });
  return result.join("");
};
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
</Editor>