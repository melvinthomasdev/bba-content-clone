List the names of students in the ascending order of length of their names.

We can use `LENGTH` in `ORDER BY` clause to get this result.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name
FROM students
ORDER BY LENGTH(name)
</code>
</codeblock>