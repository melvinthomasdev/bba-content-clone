Oliver just got his yearly assessment. His skills are graded as:

| Subject    | Score |
| ---------- | ----- |
| Physics    | 93%   |
| Maths      | 83%   |
| Chemistry  | 62%   |
| Biology    | 70%   |
| Attendance | 36%   |

The only thing holding Oliver back is his attendance which is at 36%, which doesn't seem right so he asks for re-evaluation.
After re-evaluation he gets the following results:

- Physics score dropped by 2%.
- Attendance score increased by 40%.
  Update the function accordingly to display the final assessment as:
```
The new assessment is as follows:
Physics score is P
Math score is Q
Chemistry score is R
Biology score is S
Attendance is T
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
let oliverAssessment = {
  "physics": 93,
  "maths": 83,
  "chemistry": 62,
  "biology": 70,
  "attendance": 36
};
console.log();
</code>
<solution>
const oliverAssessment = {
  "physics": 93,
  "maths": 83,
  "chemistry": 62,
  "biology": 70,
  "attendance": 36
}
const getAssessment = (assessment) => {
  assessment.physics = assessment.physics - 2;
  assessment.attendance = assessment.attendance + 40;

  return `
The new assessment is as follows:
Physics score is ${assessment.physics}
Math score is ${assessment.maths}
Chemistry score is ${assessment.chemistry}
Biology score is ${assessment.biology}
Attendance is ${assessment.attendance}`;
}
getAssessment(oliverAssessment)
</solution>
<testcases>
<caller>
console.log(getAssessment(assessment));
</caller>
<testcase>
<i>
const assessment = {
  "physics": 47,
  "maths": 76,
  "chemistry": 54,
  "biology": 77,
  "attendance": 50
}
</i>
</testcase>
<testcase>
<i>
const assessment = {
  "physics": 54,
  "maths": 62,
  "chemistry": 71,
  "biology": 64,
  "attendance": 52
}
</i>
</testcase>
<testcase>
<i>
const assessment = {
  "physics": 56,
  "maths": 86,
  "chemistry": 65,
  "biology": 78,
  "attendance": 75
}
</i>
</testcase>
<testcase>
<i>
const assessment = {
  "physics": 80,
  "maths": 67,
  "chemistry": 72,
  "biology": 69,
  "attendance": 53
}
</i>
</testcase>
</testcases>
</codeblock>
