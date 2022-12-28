Find all students whose name does _not_ contain `ony`.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT *
FROM students
WHERE name NOT LIKE '%ony%'
</solution>
</codeblock>