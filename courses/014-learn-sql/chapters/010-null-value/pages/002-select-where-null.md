Find all students whose `age` information is not available.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE age IS NULL
</code>
</Editor>