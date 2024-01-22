Extract the issue `type` from the given string.

1. Input will be a string.
2. String will start with the issue type.
3. Issue name will be separated by a colon(:).

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getIssueType = title =>
  // write your code here
</code>

<solution>
const getIssueType = title => title.substr(0, title.indexOf(":"))
</solution>

<testcases>
<caller>
console.log(getIssueType(title));
</caller>
<testcase>
<i>
const title = "bug:infinite-spinner-in-home-page";
</i>
</testcase>
<testcase>
<i>
const title = "feature:delete-multiple-issues-from-list-table";
</i>
</testcase>
<testcase>
<i>
const title = "hotfix:user-missing-after-deployment";
</i>
</testcase>
<testcase>
<i>
const title = "feature:facebook-sso";
</i>
</testcase>
</testcases>
</codeblock>