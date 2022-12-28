Find all students whose `name` starts with `To`.

We can use `%` with `LIKE` to solve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE name LIKE 'To%'
</code>
</codeblock>