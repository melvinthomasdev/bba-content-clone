Find the average of all the marks.
`AVG` can be used to solve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT AVG(marks)
FROM students
</code>
</codeblock>

`AVG` returns the average of all the not-null values in the column.
