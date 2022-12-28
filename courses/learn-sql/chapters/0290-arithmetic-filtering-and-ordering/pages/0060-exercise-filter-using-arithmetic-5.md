Display the name, age and marks of students whose age is an even number and marks are an odd number.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, age, marks
FROM students
WHERE age % 2 = 0 AND marks % 2 = 1
</solution>
</codeblock>