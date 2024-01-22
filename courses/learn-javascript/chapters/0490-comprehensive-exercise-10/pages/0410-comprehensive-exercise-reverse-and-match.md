From a list of words, find the word that matches the given input when any of them are reversed.

1. Return the matched word as it is.
2. If no match is found, return `false`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const reverseAndMatch = ({ word, list }) => {
  // your code here
}
</code>

<solution>
const reverseAndMatch = ({ word, list }) => {
  const isWordMatching = (item) =>
    [...item.toLowerCase()].reverse().join("") === word;
  const array = list.filter(isWordMatching);
  return array.length ? array[0] : false;
}
</solution>

<testcases>
<caller>
console.log(reverseAndMatch({ word, list }));
</caller>
<testcase>
<i>
const list = ["read", "dear", "match", "daer"];
const word = "read";
</i>
</testcase>
<testcase>
<i>
const list = ["Knits", "Desserts", "Sports", "Star"];
const word = "stressed";
</i>
</testcase>
<testcase>
<i>
const list = ["Raw", "Smart", "Trams", "Spoons"];
const word = "Time";
</i>
</testcase>
</testcases>
</codeblock>