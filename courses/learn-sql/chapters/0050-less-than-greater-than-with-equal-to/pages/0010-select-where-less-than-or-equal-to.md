Find all students of _age less than or equal to 7_.

We can use `<=` to perform a _less than or equal to_ operation.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE age <= 7
</code>
</codeblock>