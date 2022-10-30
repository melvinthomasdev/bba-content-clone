Use multiple line comments to
comment out lines 1 to 9.

Do not comment the code
that displays the message
`JavaScript Rocks!`.

<Editor lang="javascript" type="exercise">
<code>
const setTotalCount = respondentDetails => {
  const result = respondentDetails.map(respondent => ({
    ...respondent,
    totalCount: respondent.html + respondent.css + respondent.javascript,
  }));
  return JSON.stringify(result);
};
console.log({ html: 1, css: 2, javascript: 3 });

console.log("JavaScript Rocks!");
</code>

<solution>
/*
const setTotalCount = respondentDetails => {
  const result = respondentDetails.map(respondent => ({
    ...respondent,
    totalCount: respondent.html + respondent.css + respondent.javascript,
  }));
  return JSON.stringify(result);
};
console.log({ html: 1, css: 2, javascript: 3 });
*/

console.log("JavaScript Rocks!");
</solution>
</Editor>