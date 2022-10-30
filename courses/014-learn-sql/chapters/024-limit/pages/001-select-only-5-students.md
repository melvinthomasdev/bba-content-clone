Let's say that we want to select only 5 students.

SQL has a `LIMIT` clause which can be used to achieve this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
LIMIT 5
</code>
</Editor>

`LIMIT` returns the specified number of records from the top of the result.