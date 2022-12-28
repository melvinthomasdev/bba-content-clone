Find id and name of students in the alphabetical order of names.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT id, name
FROM students
ORDER BY name
</code>
</codeblock>

If you Note the result, when we use a string field (in this case, `name`) in `ORDER BY` clause, it results in sorting in the alphabetical order by default.