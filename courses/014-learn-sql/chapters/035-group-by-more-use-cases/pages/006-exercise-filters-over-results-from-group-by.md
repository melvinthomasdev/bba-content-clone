Write a SQL query to list only unique not-null courses having average marks obtained in each them between 30 and 69, along with the average marks obtained in each of them as avgMarks, sorted in the descending order of the avgMarks scored in them.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT course, AVG(marks) as avgMarks
FROM students
WHERE course IS NOT NULL
GROUP BY course
HAVING avgMarks BETWEEN 30 AND 69
ORDER BY avgMarks DESC
</solution>
</Editor>