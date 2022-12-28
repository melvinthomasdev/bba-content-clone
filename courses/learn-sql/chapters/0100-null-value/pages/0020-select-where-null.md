Find all students whose `age` information is not available.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE age IS NULL
</code>
</codeblock>