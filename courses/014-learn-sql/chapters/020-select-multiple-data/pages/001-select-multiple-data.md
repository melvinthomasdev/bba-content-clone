We have seen earlier that we can select multiple columns from a table.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, age
FROM students
</code>
</Editor>

Similarly, we can select multiple columns and perform some mathematical operation on these columns.
Suppose, we want to get the total age of all the students and the maximum marks in the same query.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT SUM(age), MAX(marks)
FROM students
</code>
</Editor>