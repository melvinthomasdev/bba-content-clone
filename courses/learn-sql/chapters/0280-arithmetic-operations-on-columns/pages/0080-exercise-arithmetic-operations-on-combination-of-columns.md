Display the difference in length of student name and length of the course for all the students.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT length(name) - length(course)
FROM students
</solution>
</codeblock>