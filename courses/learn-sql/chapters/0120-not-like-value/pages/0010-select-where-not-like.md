Find all students who are enrolled in a course that does _not_ start with `Ja`.

We can use `%` with `NOT LIKE` to solve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE course NOT LIKE 'Ja%'
</code>
</codeblock>