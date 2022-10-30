The function `makeItOrdinal` should return an ordinal array given an input array of numbers.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function makeItOrdinal(numbers) {
  // your code here
}
</code>

<solution>
function makeItOrdinal(numbers) {
  const newArray = [];
  for (n of numbers) {
    let s = ["th", "st", "nd", "rd"];
    let temp = n % 100;
    newArray.push(n + (s[(temp - 20) % 10] || s[temp] || s[0]));
  }
  return newArray;
}
</solution>

<testcases>
<caller>
console.log(makeItOrdinal(numbers));
</caller>
<testcase>
<i>
const numbers = [1, 2, 3, 4, 5, 6, 7];
</i>
</testcase>
<testcase>
<i>
const numbers = [456, 51, 123, 31, 2, 99, 101];
</i>
</testcase>
<testcase>
<i>
const numbers = [42, 48, 49, 111, 222, 333, 0, 5];
</i>
</testcase>
</testcases>
</Editor>