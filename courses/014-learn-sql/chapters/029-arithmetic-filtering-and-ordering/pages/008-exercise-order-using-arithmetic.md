Display the name and marks in the ascending order of the unit digit of marks.
A unit digit of marks can be calculated using `%` with 10.

<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, marks
FROM students
ORDER BY marks % 10
</solution>
</Editor>