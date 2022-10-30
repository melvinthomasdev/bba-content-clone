Find all students whose name does _not_ end with `y`.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT *
FROM students
WHERE name NOT LIKE '%y'
</solution>
</Editor>