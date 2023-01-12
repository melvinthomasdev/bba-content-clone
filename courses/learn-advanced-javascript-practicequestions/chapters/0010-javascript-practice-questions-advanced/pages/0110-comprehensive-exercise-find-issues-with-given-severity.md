Declare a function `filterIssues`
to list all the issues with the specified `severity`.
Every issue will contain the key `severity`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const filterIssues = ({ issues, severity }) => // write your code here
</code>

<solution>
const filterIssues = ({ issues, severity }) => issues.filter((issue) => issue.severity === severity);
</solution>

<testcases>
<caller>
const filteredIssues = filterIssues({ issues, severity });
console.log(JSON.stringify(filteredIssues, null, 2));
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
const severity = "medium";
</i>
</testcase>
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
const severity = "high";
</i>
</testcase>
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
const severity = "low";
</i>
</testcase>
</testcases>
</codeblock>