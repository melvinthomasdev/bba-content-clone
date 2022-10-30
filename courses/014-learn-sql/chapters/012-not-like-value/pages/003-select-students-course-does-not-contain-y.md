Find all students who are enrolled in a course that does not contain `y`.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE course NOT LIKE '%y%'
</code>
</Editor>