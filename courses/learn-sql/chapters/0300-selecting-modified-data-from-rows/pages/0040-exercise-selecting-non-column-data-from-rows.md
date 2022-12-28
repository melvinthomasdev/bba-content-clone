Display the name, age, and marks of all students.
But along with this data, we also need a new column 'schoolId', and for all the students let's display schoolId as 30516.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, age, marks, 30516 AS schoolId
FROM students
</solution>
</codeblock>