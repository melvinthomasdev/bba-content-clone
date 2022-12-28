Find all students who are enrolled in a course that does _not_ end with `t`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE course NOT LIKE '%t'
</code>
</codeblock>