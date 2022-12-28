Find all students who are enrolled in a course that does not contain `y`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE course NOT LIKE '%y%'
</code>
</codeblock>