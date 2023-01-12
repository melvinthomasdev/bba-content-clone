Follow the steps given below
to write a program:

1. Create a variable **marksObtained**
   and store the number **96** in it.

2. Use the ternary operator
   to store the string **"Pass"**
   in a variable named `result`,
   if the value of `marksObtained`
   is greater than or equal to `45`.
   Otherwise, store the string **"Fail"**
   in the `result` variable.

3. Use `console.log()` to display
   the **result** variable.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here.
</code>

<solution>
const marksObtained = 96;
const result = marksObtained >= 45 ? "Pass" : "Fail";

console.log(result);
</solution>
</codeblock>