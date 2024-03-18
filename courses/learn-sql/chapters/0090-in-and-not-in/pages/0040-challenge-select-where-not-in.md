Find all the students whose _marks is not 20, 40, 60, 80 or 100_.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT *
FROM students
WHERE marks NOT IN (20, 40, 60, 80, 100)
</solution>
</codeblock>