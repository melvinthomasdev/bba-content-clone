Given a sentence, find the longest word in it.

1. If one or more words have the same length, return the first occurring word of the same length.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const longestWord = str => {
  // your code here
};
</code>

<solution>
const longestWord = str => {
  let strArr = str.split(" ");
  return strArr.reduce(
    (longestWord, word) =>
      longestWord.length < word.length ? word : longestWord,
    ""
  );
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
</codeblock>