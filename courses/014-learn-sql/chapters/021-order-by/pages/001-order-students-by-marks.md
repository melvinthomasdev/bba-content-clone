Find names of all students with their corresponding marks.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, marks
FROM students
</code>
</Editor>

Now, we want to display the same data, but the marks should be sorted in the increasing order.
We can use `ORDER BY` to solve this problem.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, marks
FROM students
ORDER BY marks
</code>
</Editor>

The data appears with marks in the increasing order.
`ORDER BY` sorts the data as per the order of the column mentioned next to it.