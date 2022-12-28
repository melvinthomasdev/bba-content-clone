Find all students whose _age is not 12_.

We can use _not equal to_ operator `!=` to get the job done.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE age != 12
</code>
</codeblock>