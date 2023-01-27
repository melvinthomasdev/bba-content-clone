Let's say all students are to be registered on the same date and time in a software. Write a query to display id of all students and the current date.
Set the headers as `id` and `currentDate` respectively.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput" cache="false">
<code>
SELECT
FROM
</code>

<solution>
SELECT id, DATE('Now') AS currentDate
FROM students
</solution>
</codeblock>
