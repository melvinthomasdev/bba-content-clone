Return object with issues grouped by severity.

1. Input will be list of issues.
2. Issue will contain a key `severity` with string value.
3. Return an object with `severity` as key and list of assignees as value.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const groupBySeverity = issues => {
  // write your code here
}
</code>

<solution>
const groupBySeverity = issues => {
  const groupedIssues = {};
  issues.forEach(issue => {
    if (!groupedIssues[issue.severity])
      groupedIssues[issue.severity] = []
    groupedIssues[issue.severity].push(issue.assignee);
  });
  return groupedIssues;
}
</solution>

<testcases>
<caller>
const groupedIssues = groupBySeverity(issues);
console.log(JSON.stringify(groupedIssues, null, 2));
</caller>
<testcase>
<i>
const issues = [
  {
    title: "View is not symmetric",
    severity: "low",
    assignee: "Eric"
  },
  {
    title: "Title color is not as per design",
    severity: "medium",
    assignee: "John"
  },
  {
    title: "Oliver is not able to login",
    severity: "high",
    assignee: "Eric"
  },
  {
    title: "Submit button is disabled",
    severity: "high",
    assignee: "John"
  },
  {
    title: "Table content overflowing",
    severity: "medium",
    assignee: "John"
  }
];
</i>
</testcase>
</testcases>
</codeblock>