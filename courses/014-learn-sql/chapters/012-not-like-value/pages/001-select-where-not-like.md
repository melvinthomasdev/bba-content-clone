Find all students who are enrolled in a course that does _not_ start with `Ja`.

We can use `%` with `NOT LIKE` to solve this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE course NOT LIKE 'Ja%'
</code>
</Editor>