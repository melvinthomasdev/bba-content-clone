Find all the distinct courses
and
the minimum marks students have scored in each course.
The column header for "minimum marks" should be `minMarks`.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT course, MIN(marks) AS minMarks
FROM students
WHERE course IS NOT NULL
GROUP BY course
</solution>
</Editor>