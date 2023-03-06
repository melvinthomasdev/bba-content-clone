* If the score is 100, then grade is **A+**.
* If the score is more than 80 and less than 100, then grade is **A**.
* If the score is more than 60 and less than 81, then grade is **B**.
* If the score is 60 or less than 60, then grade is **C**.

Based on the above conditions write a function to take the grade and print accordingly:
`You got X grade.`
Use the following scores to check the program.
- 88
- 43
- 66
- 41

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here
</code>

<solution>
const getGrade = (score) => {
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

	return `You got ${grade} grade.`;
};
getGrade(88);
getGrade(43);
getGrade(66);
getGrade(41);
</solution>
<testcases>
<caller>
console.log(getGrade(grade));
</caller>
<testcase>
<i>
grade = 50;
</i>
</testcase>
<testcase>
<i>
grade = 68;
</i>
</testcase>
<testcase>
<i>
grade = 60;
</i>
</testcase>
<testcase>
<i>
grade = 75;
</i>
</testcase>
</testcases>
</codeblock>
