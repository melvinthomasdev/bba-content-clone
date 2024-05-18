Return object with issues grouped by severity.

1. Input will be list of issues.
2. Issue will contain a key `severity` with string value.
3. Return an object with `severity` as key and list of assignees as value.

```js
Input:
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

Output:
{
  "low": ["Eric"],
  "medium": ["John"],
  "high": ["Eric", "John"]
}
```
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
<testcase>
<i>
const issues = [
  {
    title: "Calculations are incorrect",
    severity: "high",
    assignee: "Eric"
  },
  {
    title: "Background color is not as per design",
    severity: "medium",
    assignee: "Eve"
  },
  {
    title: "Admins are not able to login",
    severity: "high",
    assignee: "Sam"
  },
  {
    title: "Buttons are disabled everywhere",
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
<testcase>
<i>
const issues = [
  {
    title: "Dashboard content is missing",
    severity: "high",
    assignee: "Sam"
  },
  {
    title: "Send button does not submit the form",
    severity: "medium",
    assignee: "Eve"
  },
  {
    title: "Automation fails at login",
    severity: "high",
    assignee: "Sam"
  },
  {
    title: "Stay logged in checkbox does not keep the user logged in",
    severity: "high",
    assignee: "Sam"
  }
];
</i>
</testcase>
<testcase>
<i>
const issues = [
  {
    title: "Form labels are missing",
    severity: "high",
    assignee: "Sam"
  },
  {
    title: "Missing images on products page",
    severity: "high",
    assignee: "Eve"
  },
  {
    title: "Minor spelling error in header",
    severity: "low",
    assignee: "Sam"
  },
  {
    title: "Logout button does not work",
    severity: "high",
    assignee: "Sam"
  }
];
</i>
</testcase>
</testcases>
</codeblock>
