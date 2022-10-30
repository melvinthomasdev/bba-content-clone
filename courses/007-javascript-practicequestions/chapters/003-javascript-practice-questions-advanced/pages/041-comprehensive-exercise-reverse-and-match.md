From a list of words, find the word that matches the given input when any of them are reveresed.

1. Return the matched word as it is.
2. if none found, return false

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function reverseAndMatch(word, list) {
  // your code here
}
</code>

<solution>
function reverseAndMatch(word, list) {
  const condition = (item) =>
    [...item.toLowerCase()].reverse().join("") === word;
  const array = list.filter((...items) => condition(...items));
  return array.length ? array[0] : false;
}
</solution>

<testcases>
<caller>
console.log(reverseAndMatch(word, list));
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
</Editor>