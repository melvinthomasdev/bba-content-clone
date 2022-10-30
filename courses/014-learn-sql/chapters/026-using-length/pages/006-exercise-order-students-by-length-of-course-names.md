List the names of students and the course they are enrolled in the reverse order of length of course names.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, course
FROM students
ORDER BY LENGTH(course) DESC
</solution>
</Editor>