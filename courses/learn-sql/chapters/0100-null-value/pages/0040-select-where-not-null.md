Find all students whose `grade` information is available.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE grade IS NOT NULL
</code>
</codeblock>