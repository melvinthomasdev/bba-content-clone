Find all students whose ids are an odd number.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT name
FROM
WHERE
</code>

<solution>
SELECT name FROM students WHERE id % 2 = 1
</solution>
</codeblock>