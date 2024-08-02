We have a function **incrementCount**.
It takes two arguments, **count**
and **maximumCount**.

Increment the **count** value by 1
and add it to itself.

Keep doing this as many
times as possible, ensuring that
the value of **count** stays smaller
than **maximumCount**.
The function should
return the final sum.

1. The **count** should
increment at least once
irrespective of the
**maximumCount** value.

2. Do **NOT** use loops.
Use higher-order functions
like `map`, `filter`, etc.

3. **Order matters**: You need
to first increment the value of count,
and
then add it to itself.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const incrementCount = ({ count, maximumCount }) => {
  // Write code below this line
}
</code>

<solution>
const incrementCount = ({ count, maximumCount }) => {
  // Write code below this line
  const numberOfIncrements = Math.max(maximumCount - count, 1);
  const incrementedValues = Array.from({ length: numberOfIncrements }, (val, index) => count + index + 1);
  return incrementedValues.reduce((sum, value) => sum + value, 0);
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
