The function `fruitSalad` should slice each name of the fruit in half, sort the each chunks alphabetically and join them together to make a string.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const fruitSalad = (str) => {
  // your code here
};
</code>

<solution>
const fruitSalad = (str) => {
  const chunks = [];
  for (const s of str) {
    chunks.push(s.slice(0, s.length / 2));
    chunks.push(s.slice(s.length / 2, s.length));
  }
  return chunks.sort().join("");
};
</solution>

<testcases>
<caller>
console.log(fruitSalad(str));
</caller>
<testcase>
<i>
const str = ["apple", "pear", "grapes"];
</i>
</testcase>
<testcase>
<i>
const str = ["raspberries", "mango"];
</i>
</testcase>
<testcase>
<i>
const str = ["banana"];
</i>
</testcase>
</testcases>
</Editor>