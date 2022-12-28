Let's say we want to display all the ids common to students and books.

In this case, we need to include data from two entirely different queries:

1. `SELECT id FROM students`

2. `SELECT id FROM books`

and get common ids from them together in a single column.

For such a use case, SQL provides a clause similar to `UNION`, called `INTERSECT`, which helps display common data of different types together, from results of two or more queries.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT id
FROM students
INTERSECT
SELECT id
FROM books
</code>
</codeblock>

Notice that we get only ids 1 to 25 in the results. `students` have ids ranging from 1 to 25, `books` have ids ranging from 1 to 34. The common data amongst the two results is 1 to 25, hence the result from the `INTERSECT` query above.
