Find all students who are enrolled in a course that does _not_ end with `t`.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE course NOT LIKE '%t'
</code>
</Editor>