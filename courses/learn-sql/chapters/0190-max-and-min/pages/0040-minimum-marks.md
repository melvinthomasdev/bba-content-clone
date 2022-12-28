Find the minimum marks.

We can use aggregate function `MIN` to solve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT MIN(marks)
FROM students
</code>
</codeblock>

`MIN` returns the minimum of all the not-null values in the column.