The function `getDayOfWeek()` takes a day **value**
as input and returns the corresponding day
of the week based on the following table:

| Value | Message     |
| ----- | ----------- |
| 1     | Sunday    |
| 2     | Monday    |
| 3     | Tuesday   |
| 4     | Wednesday |
| 5     | Thursday  |
| 6     | Friday    |
| 7     | Saturday  |

If the provided **value** does not match any of the listed values,
the function returns **Invalid day!**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function getDayOfWeek(day) {
  // your code here
}
</code>

<solution>
function getDayOfWeek(day) {
  switch (day) {
    case 1:
      return "Sunday";
    case 2:
      return "Monday";
    case 3:
      return "Tuesday";
    case 4:
      return "Wednesday";
    case 5:
      return "Thursday";
    case 6:
      return "Friday";
    case 7:
      return "Saturday";
    default:
      return "Invalid day!";
  }
}
</solution>

<testcases>
<caller>
console.log(getDayOfWeek(day));
</caller>
<testcase>
<i>
const day = 1;
</i>
</testcase>
<testcase>
<i>
const day = 3;
</i>
</testcase>
<testcase>
<i>
const day = 5;
</i>
</testcase>
<testcase>
<i>
const day = 9;
</i>
</testcase>
</testcases>
</codeblock>
