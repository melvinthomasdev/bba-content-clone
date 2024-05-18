We have the latest details of the number of respondents for a Practice Question Challenge. We need to evaluate the total number of questions they answered in each section. This value should be set to a newly created `totalCount` property.

1. The section properties will have values at all times.

For example:
```js
Input:
let respondentDetails = [
  {
    name: "Sam",
    html: 21,
    css: 18,
    javascript: 29,
  },
  {
    name: "Renu",
    html: 11,
    css: 22,
    javascript: 33,
  },
  {
    name: "Eve",
    html: 12,
    css: 34,
    javascript: 45,
  },
];

Output:
[
  {
    "name": "Sam",
    "html": 21,
    "css": 18,
    "javascript": 29,
    "totalCount": 68
  },
  {
    "name": "Renu",
    "html": 11,
    "css": 22,
    "javascript": 33,
    "totalCount": 66
  },
  {
    "name": "Eve",
    "html": 12,
    "css": 34,
    "javascript": 45,
    "totalCount": 91
  }
]
```

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
  return result;
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
<testcase>
<i>
let respondentDetails = [
  {
    name: "Sam",
    html: 21,
    css: 18,
    javascript: 29,
  },
  {
    name: "Renu",
    html: 11,
    css: 22,
    javascript: 33,
  },
  {
    name: "Eve",
    html: 12,
    css: 34,
    javascript: 45,
  },
];
</i>
</testcase>
</testcases>
</codeblock>
