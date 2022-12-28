Follow the steps given below
to write a program:

1. Create a variable **number**
   and store the number **9** in it.

2. Write an `if` statement
   to check if **number**
   is exactly divisible by **3**.

3. In the `if` statement, display on the
   console, **"Number is divisible by 3"** when
   **number** is exactly divisible by **3**.

4. Use an `else` statement, to display on the
   console, **"Number is not a multiple of 3"** when
   **number** is not divisible by **3**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here.
</code>

<solution>
const number = 9;
if(number % 3 === 0) {
  console.log("Number is divisible by 3");
} else {
  console.log("Number is not a multiple of 3");
}
</solution>
</codeblock>