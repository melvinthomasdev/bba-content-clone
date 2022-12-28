Find all students whose `name` ends with `r`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE name LIKE '%r'
</code>
</codeblock>