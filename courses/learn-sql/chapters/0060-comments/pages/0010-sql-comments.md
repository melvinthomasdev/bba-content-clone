Let's say we have a query to get all students whose grade is less than 8.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE grade < 8
</code>
</codeblock>

Suppose we quickly want to check the list of all students without actually deleting the WHERE condition from query.

Like all other programming languages, we can use `comments` in SQL too to mark part of code not to be run.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
-- WHERE grade < 8
</code>
</codeblock>

Any part of a line starting from `--` till the end of line will be considered a comment.
Go ahead and run the query below where the entire query is in a single line.
Some part of the query is commented out. 


<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT * FROM students -- WHERE grade < 8
</code>
</codeblock>

We can also use comments to add documentation to our queries.


<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
-- This query selects all students who are in grade less than 8.
SELECT *
FROM students
WHERE grade < 8
</code>
</codeblock>