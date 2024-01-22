The function `fruitSalad` should slice each name of the fruit in half, sort each chunk alphabetically and join them together to make a string.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const fruitSalad = words => {
  // your code here
};
</code>

<solution>
const fruitSalad = words => {
  const chunks = [];
  words.forEach((word) => {
    chunks.push(word.slice(0, word.length / 2));
    chunks.push(word.slice(word.length / 2, word.length));
  })
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
</codeblock>