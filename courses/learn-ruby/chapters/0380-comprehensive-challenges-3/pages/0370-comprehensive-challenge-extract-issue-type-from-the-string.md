Finish the method definition below.

`title` is a string that contains an issue type and a description of the issue, separated by a colon `:`. Given `title`, the method should return the issue type.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def issue_type(title)
  # Write your code here
end
</code>

<solution>
def issue_type(title)
  title.split(':').first
end
</solution>

<testcases>
<caller>
puts issue_type(title)
</caller>
<testcase>
<i>
title = "bug:infinite-spinner-in-home-page"
</i>
</testcase>
<testcase>
<i>
title = "feature:delete-multiple-issues-from-list-table"
</i>
</testcase>
<testcase>
<i>
title = "hotfix:user-missing-after-deployment"
</i>
</testcase>
<testcase>
<i>
title = "feature:facebook-sso"
</i>
</testcase>
<testcase>
<i>
title = "feature:edit-attachments-integration"
</i>
</testcase>
<testcase>
<i>
title = "bug:broken-image-url"
</i>
</testcase>
</testcases>
</codeblock>
