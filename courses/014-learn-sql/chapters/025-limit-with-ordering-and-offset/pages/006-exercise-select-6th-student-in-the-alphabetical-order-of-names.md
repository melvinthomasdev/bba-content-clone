Write a query to display the `student name` and `age` on the `6th position`, if the students are sorted in alphabetical order of their names.

<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
ORDER BY
LIMIT
</code>

<solution>
SELECT name, age
FROM students
ORDER BY name
LIMIT 1
OFFSET 5
</solution>
</Editor>