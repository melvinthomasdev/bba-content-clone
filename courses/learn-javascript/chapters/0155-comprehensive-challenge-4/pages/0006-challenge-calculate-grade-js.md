- If the score is 100, then grade is **A+**.
- If the score is more than 80 and less than 100, then grade is **A**.
- If the score is more than 60 and less than 81, then grade is **B**.
- If the score is 60 or less than 60, then grade is **C**.

Based on the above conditions
create a function `getGrade`
that accepts two parameters
`score` and `name`
The function should log
`[name] got X grade.`
accordingly to the console.

```js
Input: score = 79, name = Sam

output: "Sam got A grade."
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here
</code>

<solution>
const getGrade = (score, name) => {
	let grade = null;

  if (score === 100) {
  	grade = "A+";
  } else if (score > 80 && score < 100) {
  	grade = "A";
  } else if (score > 60 && score < 81) {
  	grade = "B"
  } else if (score < 61) {
  	grade = "C";
  }

  console.log(`${name} got ${grade} grade.`);

};

</solution>
<testcases>
<caller>
getGrade(testScore, testName);
</caller>
<testcase>
<i>
let testScore = 50;
let testName = "Tom";
</i>
</testcase>
<testcase>
<i>
let testScore = 68;
let testName = "Henry";
</i>
</testcase>
<testcase>
<i>
let testScore = 60;
let testName = "Jon";
</i>
</testcase>
<testcase>
<i>
let testScore = 75;
let testName = "Ed";
</i>
</testcase>
</testcases>
</codeblock>
