John took a Math test.
He got a score of 28 out
of 100.

Write a program that
will print John's grade
based on the following
conditions:

* If the score is 100, then print **You got A+ grade**.
* If the score is more than 80 and less than 100, then print **You got A grade**.
* If the score is more than 60 and less than 81, then print **You got B grade**.
* If the score is 60 or less than 60, then print **You got C grade**.

Use `if` and `else`
conditions to solve
this problem.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
</code>

<solution>
const score = 88;

if(score === 100){
  console.log("You got A+ grade");
} else if(score > 80 && score < 100){
  console.log("You got A grade");
} else if(score > 60 && score < 81){
  console.log("You got B grade")
} else if(score < 61){
  console.log("You got C grade")
}
</solution>
</codeblock>