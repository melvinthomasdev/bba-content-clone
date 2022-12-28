Let's say all students are to be registered at the same date and time in a software. Write a query to display id of all students, the current date and the current time.
Set the headers as `id`, `currentDate` and `currentTime` respectively.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT id, DATE('Now') AS currentDate, TIME('Now') AS currentTime
FROM students
</solution>
</codeblock>