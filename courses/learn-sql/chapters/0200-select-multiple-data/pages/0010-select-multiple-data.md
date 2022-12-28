We have seen earlier that we can select multiple columns from a table.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, age
FROM students
</code>
</codeblock>

Similarly, we can select multiple columns and perform some mathematical operation on these columns.
Suppose, we want to get the total age of all the students and the maximum marks in the same query.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT SUM(age), MAX(marks)
FROM students
</code>
</codeblock>