Let's look at another example:

<codeblock language="javascript" type="lesson">
<code>
function calculatePercentage(value, total) {
  return (value / total) * 100;
}

function checkPassOrFail(marksObtained, totalMarks) {
  const percentage = calculatePercentage(marksObtained, totalMarks);
  if (percentage >= 50) {
    return "Pass";
  } else {
    return "Fail";
  }
}

const examResult = checkPassOrFail(75, 100);
console.log(examResult);
</code>
</codeblock>

In the above example,
the **calculatePercentage** function
uses **return** to provide the
calculated percentage value.
This enables us to determine
if it is a **Pass** or **Fail**
in the **checkPassOrFail** function.
Thus, returning values makes
our code **modular**, **reusable**,
and more **organized**.
