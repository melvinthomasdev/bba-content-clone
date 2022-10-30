Find all distinct grades and the average of all marks students have scored in each grade.
The column header for "average of all marks" should be `avgOfMarks`.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT grade, AVG(marks) AS avgOfMarks
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</solution>
</Editor>