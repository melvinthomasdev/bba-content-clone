Find the names of all students whose age is an even number.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT name
FROM
WHERE
</code>

<solution editor="1">
SELECT name FROM students WHERE age % 2 = 0
</solution>
</codeblock>