We have the latest details of the number of respondents for a Practice Question Challenge. We need to evaluate the total number of questions they answered in each section. This value should be set to a newly created `totalCount` property.

1. The section properties will have values at all times.
2. Return stringified object.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const setTotalCount = respondentDetails => {
  // your code here
}
</code>

<solution>
const setTotalCount = respondentDetails => {
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
</codeblock>