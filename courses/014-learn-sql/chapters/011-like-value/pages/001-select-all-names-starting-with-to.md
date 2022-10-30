Find all students whose `name` starts with `To`.

We can use `%` with `LIKE` to solve this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE name LIKE 'To%'
</code>
</Editor>