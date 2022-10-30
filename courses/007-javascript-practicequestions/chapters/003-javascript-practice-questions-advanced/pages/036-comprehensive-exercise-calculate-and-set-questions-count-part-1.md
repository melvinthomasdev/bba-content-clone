We have the latest details of a number of respondents for a Practice Question Challenge. We need to evaluate total questions they answered in each section. This value should be set to a newly created `totalCount` property.

1. The section properties will have values at all times.
2. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function setTotalCount(respondentDetails) {
  // your code here
}
</code>

<solution>
function setTotalCount(respondentDetails) {
   const result = respondentDetails.map((respondent) => {
    return {
      ...respondent,
      totalCount: respondent.html + respondent.css + respondent.javascript
    };
  })
  return JSON.stringify(result);
}
</solution>

<testcases>
<caller>
console.log(setTotalCount(respondentDetails));
</caller>
<testcase>
<i>
let respondentDetails = [
  {
    name: "Jacqueline",
    html: 30,
    css: 11,
    javascript: 23,
  },
  {
    name: "Dawson",
    html: 30,
    css: 27,
    javascript: 15,
  },
  {
    name: "Jocelyn",
    html: 30,
    css: 15,
    javascript: 19,
  },
];
</i>
</testcase>
<testcase>
<i>
let respondentDetails = [
  {
    name: "Jacqueline",
    html: 30,
    css: 11,
    javascript: 23,
  },
  {
    name: "Dawson",
    html: 30,
    css: 27,
    javascript: 15,
  },
  {
    name: "Jocelyn",
    html: 30,
    css: 15,
    javascript: 19,
  },
];
</i>
</testcase>
<testcase>
<i>
let respondentDetails = [
  {
    name: "Jacqueline",
    html: 30,
    css: 11,
    javascript: 23,
  },
  {
    name: "Dawson",
    html: 30,
    css: 27,
    javascript: 15,
  },
  {
    name: "Jocelyn",
    html: 30,
    css: 15,
    javascript: 19,
  },
];
</i>
</testcase>
</testcases>
</Editor>