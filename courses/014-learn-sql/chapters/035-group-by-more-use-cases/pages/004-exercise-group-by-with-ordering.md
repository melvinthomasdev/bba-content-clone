Write a query to list all unique not-null courses and the maximum marks obtained in each of them as "maxMarks" by the students.
Sort the result in the ascending order of the maximum marks scored.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT course, MAX(marks) as maxMarks
FROM students
WHERE course IS NOT NULL
GROUP BY course
ORDER BY maxMarks
</solution>
</Editor>