Find all students whose `grade` information is available.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE grade IS NOT NULL
</code>
</Editor>