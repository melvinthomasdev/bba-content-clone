Find all students whose `name` contains `ar`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE name LIKE '%ar%'
</code>
</codeblock>