Calculate the maximum marks among all the students who are enrolled in the Python course.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT MAX(marks)
FROM students
WHERE course = 'Python'
</solution>
</codeblock>