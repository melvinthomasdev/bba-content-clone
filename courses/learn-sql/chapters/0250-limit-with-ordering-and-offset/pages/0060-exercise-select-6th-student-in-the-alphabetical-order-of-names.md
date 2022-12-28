Write a query to display the `student name` and `age` on the `6th position`, if the students are sorted in alphabetical order of their names.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
ORDER BY
LIMIT
</code>

<solution>
SELECT name, age
FROM students
ORDER BY name
LIMIT 1
OFFSET 5
</solution>
</codeblock>