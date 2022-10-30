Find the names of the top 6 students in the reverse alphabetical order of their names.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT name
FROM students
ORDER BY name desc
LIMIT 6
</solution>
</Editor>