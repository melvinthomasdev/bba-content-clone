The function `makeItOrdinal` should return an ordinal array given an input array of numbers.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const makeItOrdinal = numbers => {
  // your code here
}
</code>

<solution>
const makeItOrdinal = numbers => {
  const suffix = ["th", "st", "nd", "rd"];
  return numbers.map((number) => {
    const remainder = number % 100;
    return `${number}${suffix[(remainder - 20) % 10] || suffix[remainder] || suffix[0]}`;
  })
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
</codeblock>