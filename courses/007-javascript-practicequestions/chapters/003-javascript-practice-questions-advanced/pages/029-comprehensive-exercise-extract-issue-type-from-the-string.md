Extract the issue type from given the string.

1. Input will be a string.
2. String will start with the issue type.
3. Issue name will be separated by a colon.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function getIssueType(title){
  // write your code here
}
</code>

<solution>
function getIssueType(title){
  return title.substr(0, title.indexOf(":"));
}
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
<testcase>
<i>
const title = "feature:edit-attachments-integration";
</i>
</testcase>
<testcase>
<i>
const title = "bug:broken-image-url";
</i>
</testcase>
</testcases>
</Editor>