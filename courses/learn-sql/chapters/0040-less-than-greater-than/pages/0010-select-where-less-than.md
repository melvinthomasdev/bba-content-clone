Find all students who _belong to grade less than 8_.

We can use `<` to perform a _less than_ operation.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE grade < 8
</code>
</codeblock>