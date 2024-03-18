Display the list of unique courses and the number of students in each of those courses.
The column header of the number of students in each course should be `numberOfStudents`.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT course, COUNT(*) AS numberOfStudents
FROM students
WHERE course IS NOT NULL
GROUP BY course
</solution>
</codeblock>