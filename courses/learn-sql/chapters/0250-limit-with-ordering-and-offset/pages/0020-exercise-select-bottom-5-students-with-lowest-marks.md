Find the name and marks of first 5 students with lowest marks in increasing order of marks.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, marks
FROM students
ORDER BY marks
LIMIT 5
</solution>
</codeblock>