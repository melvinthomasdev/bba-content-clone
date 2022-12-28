Find names of all students with their corresponding marks.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, marks
FROM students
</code>
</codeblock>

Now, we want to display the same data, but the marks should be sorted in the increasing order.
We can use `ORDER BY` to solve this problem.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, marks
FROM students
ORDER BY marks
</code>
</codeblock>

The data appears with marks in the increasing order.
`ORDER BY` sorts the data as per the order of the column mentioned next to it.