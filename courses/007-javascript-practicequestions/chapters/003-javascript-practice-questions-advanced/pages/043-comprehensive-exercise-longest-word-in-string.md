Given a sentence, find the longest word in the it.

1. If one or more words have the same length, return the first occuring word of the same length.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const longestWord = (str) => {
  // your code here
};
</code>

<solution>
const longestWord = (str) => {
  let strArr = str.split(" ");
  let longestWord = strArr.reduce((acc, curr) => {
    return acc.length >= curr.length ? acc : curr;
  });
  return longestWord;
};
</solution>

<testcases>
<caller>
console.log(longestWord(str));
</caller>
<testcase>
<i>
const str = "Built by folks at BigBinary";
</i>
</testcase>
<testcase>
<i>
const str = "Hello World";
</i>
</testcase>
<testcase>
<i>
const str = "I love icecream";
</i>
</testcase>
<testcase>
<i>
const str = "Evenly Sized";
</i>
</testcase>
</testcases>
</Editor>