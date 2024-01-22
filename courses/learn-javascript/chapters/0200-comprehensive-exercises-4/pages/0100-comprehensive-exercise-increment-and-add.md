Given an input `count`, increment the same by 1 and add it to itself. Continue the same till the count value reaches the maximum count. The function should return the final sum.

1. The count should increment at least once irrespective of the maximum count.
2. Do **NOT** use `do..while` or any other looping constructs. Use higher-order functions like `map`, `filter`, etc.
3. Order matters: You need to first increment count, and then get the sum.

```
( ie, for (count = 2, maxCount = 12): 2 + 1 = 3; 2 + 3 = 5;)
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const incrementCount = ({ count, maximumCount }) => {
  // your code here
  // Refer: https://stackoverflow.com/a/20066663
}
</code>

<solution>
// Refer: https://stackoverflow.com/a/20066663
const incrementCount = ({ count, maximumCount }) => {
  const iterations = Math.max(maximumCount - count, 1);
  return Array.apply(null, { length: iterations }).reduce(totalSum => {
    count++;
    return totalSum + count;
  }, 0);
};
</solution>

<testcases>
<caller>
console.log(incrementCount({ count, maximumCount }));
</caller>
<testcase>
<i>
const count = 3;
const maximumCount = 7;
</i>
</testcase>
<testcase>
<i>
const count = 1;
const maximumCount = 10;
</i>
</testcase>
<testcase>
<i>
const count = 21;
const maximumCount = 21;
</i>
</testcase>
<testcase>
<i>
const count = 4;
const maximumCount = 3;
</i>
</testcase>
</testcases>
</codeblock>