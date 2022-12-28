Find the names of the top 6 students in the reverse alphabetical order of their names.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name
FROM students
ORDER BY name desc
LIMIT 6
</solution>
</codeblock>