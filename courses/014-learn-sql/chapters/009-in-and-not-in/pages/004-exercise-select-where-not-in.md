Find all the students whose _marks is not 20, 40, 60, 80 or 100_.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT *
FROM students
WHERE marks NOT IN (20, 40, 60, 80, 100)
</solution>
</Editor>