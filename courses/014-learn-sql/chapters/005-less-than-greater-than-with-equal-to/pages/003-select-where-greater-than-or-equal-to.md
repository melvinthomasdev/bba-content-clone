Find all students who belong to a _grade greater than or equal to 9_.

We can use `>=` to perform a _greater than or equal to_ operation.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE grade >= 9
</code>
</Editor>