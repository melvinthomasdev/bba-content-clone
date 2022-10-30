Let's say we want to display the names of students as well as authors, in a single column called "**People**".

In this case, we need to include data from two entirely different queries and present them in a single column:

1. `SELECT name FROM students`

2. `SELECT name FROM authors`

For such cases, SQL provides a combination clause called `UNION`.

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT name AS people
FROM students
UNION
SELECT name AS people
FROM authors
</code>
</Editor>

Notice that the result contain 35 rows of names. There are 25 rows of students and 10 rows of authors.

Another key thing to notice about `UNION` is, the number of columns from each query should be equal.

Go ahead and run the query below. You will see an error.

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT name, id FROM students
UNION
SELECT name FROM authors
</code>
</Editor>

We see an error because the first query in the `UNION` result produces two columns, while the second one produces only one, which is not acceptable in a `UNION`.
