We have the latest details of the number of respondents for a Practice Question Challenge. We need to evaluate the total number of questions they answered in each section. This value should be set to a newly created `totalCount` property.

1. The count of sections in each input may vary.

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
      totalCount: Object.values(respondent).reduce((a, b) => a + b,0)
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
    html: 30,
    css: 11,
    javascript: 23,
    react: 21,
  },
  {
    html: 30,
    css: 27,
    javascript: 15,
    ruby: 25,
  },
  {
    html: 30,
    css: 15,
    javascript: 19,
    ruby: 25,
    sql: 27,
    tailwindCSS: 15

},
];
</i>
</testcase>
<testcase>
<i>
let respondentDetails = [
  {
    html: 30,
    css: 27
  },
  {
    html: 29,
    css: 24,
    javascript: 17,
  },
  {
    html: 30,
    css: 15,
    javascript: 19,
    ruby: 19,
    sql: 25
  },
];
</i>
</testcase>
</testcases>
</codeblock>