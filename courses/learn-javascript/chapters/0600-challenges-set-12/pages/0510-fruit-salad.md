The function `fruitSalad` should slice
each name of the fruit in half,
sort each chunk alphabetically
and
join them together to make a string.

If the length of the fruit name is
odd, the first chunk can have an extra
letter.

For example:
```js
Input:
const arr = ["apple", "pineapple", "orange"];

Output:
appelaeinpelppaoregn
```

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
    const middle = Math.ceil(word.length/2);
    chunks.push([...word.slice(0, middle)].sort().join(""));
    chunks.push([...word.slice(middle)].sort().join(""));
  })
  return chunks.join("");
};
</solution>

<testcases>
<caller>
console.log(fruitSalad(arr));
</caller>
<testcase>
<i>
const arr = ["apple", "pear", "grapes"];
</i>
</testcase>
<testcase>
<i>
const arr = ["raspberries", "mango"];
</i>
</testcase>
<testcase>
<i>
const arr = ["banana"];
</i>
</testcase>
<testcase>
<i>
const arr = ["orange", "pomegranate", "pineapple", "kiwi"];
</i>
</testcase>
</testcases>
</codeblock>
