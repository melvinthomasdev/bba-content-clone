Let's say we have a query to get all students whose grade is less than 8.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE grade < 8
</code>
</Editor>

Suppose we quickly want to check the list of all students without actually deleting the WHERE condition from query.

Like all other programming languages, we can use `comments` in SQL too to mark part of code not to be run.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
-- WHERE grade < 8
</code>
</Editor>

Any part of a line starting from `--` till the end of line will be considered a comment.
Go ahead and run the query below where the entire query is in a single line.
Some part of the query is commented out. 


<Editor lang="sql" dbName="students1.db">
<code>
SELECT * FROM students -- WHERE grade < 8
</code>
</Editor>

We can also use comments to add documentation to our queries.


<Editor lang="sql" dbName="students1.db">
<code>
-- This query selects all students who are in grade less than 8.
SELECT *
FROM students
WHERE grade < 8
</code>
</Editor>