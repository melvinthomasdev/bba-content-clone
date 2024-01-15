Complete the function `makeItOrdinal` that
takes an array of numbers as input and
returns an array of corresponding ordinals.

For instance, if the input array is `[1, 2, 3]`,
the function should return `['1st', '2nd', '3rd']`.

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
<testcase>
<i>
const numbers = [206, 101, 88, 384, 291, 171];
</i>
</testcase>
</testcases>
</codeblock>
