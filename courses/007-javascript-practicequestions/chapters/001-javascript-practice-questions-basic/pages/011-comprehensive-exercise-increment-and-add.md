Given an input `count`, increment the same by 1 and add it to itself. Continue the same till count value reaches maximum count. The function should return the final sum.

1. The count should increment atleast once irrespective of the maximum count.
2. Order matters: You need to first increment count, and then get the sum.

```

( ie, for (count = 2, maxCount = 12): 2 + 1 = 3; 2 + 3 = 5;)

```

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const incrementCount = function(count, maximumCount) {
  // your code here
}
</code>

<solution>
const incrementCount = function(count, maximumCount) {
  let sum = 0;
  do {
    count++;
    sum = count + sum;
  } while (count < maximumCount)
  return sum;
}
</solution>

<testcases>
<caller>
console.log(incrementCount(count, maximumCount));
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
</Editor>