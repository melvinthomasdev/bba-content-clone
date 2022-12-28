Let's say that we want to find students who are at
position 6, position 7, position 8, position 9 and position 10
when students are ranked by their marks in the descending order.

We clearly need to use `ORDER BY` to sort students.
We also need to use `LIMIT` to select only 5 students (position 6 to position 10).
But how do we make sure that the starting position is position 6?

SQL provides `OFFSET` which sets the starting position.
When we use `LIMIT` then we take a number of records from the top.
It means starting position is 0.

First let's run the code without any `LIMIT` or `OFFSET`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
ORDER BY marks DESC
--LIMIT 5
--OFFSET 5
</code>
</codeblock>

We can see that in the above result that "Johnson" is at position 6.
We want "Johnson" in the list since we want 5 people starting from position 6.
So we should set our `OFFSET` value to 5.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
ORDER BY marks DESC
LIMIT 5
OFFSET 5
</code>
</codeblock>