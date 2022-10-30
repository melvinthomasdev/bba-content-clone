Find the minimum marks.

We can use aggregate function `MIN` to solve this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT MIN(marks)
FROM students
</code>
</Editor>

`MIN` returns the minimum of all the not-null values in the column.