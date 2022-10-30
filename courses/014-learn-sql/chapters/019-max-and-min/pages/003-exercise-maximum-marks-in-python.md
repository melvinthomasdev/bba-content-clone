Calculate the maximum marks among all the students who are enrolled in the Python course.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT MAX(marks)
FROM students
WHERE course = 'Python'
</solution>
</Editor>