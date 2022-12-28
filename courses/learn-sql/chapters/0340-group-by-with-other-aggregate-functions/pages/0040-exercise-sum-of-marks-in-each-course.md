Find all distinct courses and the total sum of all marks students have scored in each course.
The column header for "sum of marks" should be `sumOfMarks`.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT course, SUM(marks) AS sumOfMarks
FROM students
WHERE course IS NOT NULL
GROUP BY course
</solution>
</codeblock>