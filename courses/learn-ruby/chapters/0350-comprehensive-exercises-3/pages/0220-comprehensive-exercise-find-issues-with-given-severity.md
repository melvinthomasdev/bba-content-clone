Finish the method definition below.

`issues` is an array of hashes, each of which has three keys: "severity", "title", and "assignee". Given `issues` and a string `severity`, the method should return the filtered array out of `issues`, that have the same severity as `severity`.



<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def filter_issues(issues, severity)
  # write your code here
end
</code>

<solution>
def filter_issues(issues, severity)
  issues.select { |issue| issue[:severity] == severity }
end
</solution>

<testcases>
<caller>
puts filter_issues(issues, severity)
</caller>
<testcase>
<i>
issues = [
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
]
severity = "medium"
</i>
</testcase>
<testcase>
<i>
issues = [
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
]
severity = "high"
</i>
</testcase>
<testcase>
<i>
issues = [
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
]
severity = "low"
</i>
</testcase>
</testcases>
</codeblock>
