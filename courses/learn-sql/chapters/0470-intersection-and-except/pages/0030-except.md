Let's say we want to display all the ids belonging to books, which are not ids of any of the students.

In this case, we need to get data from two entirely different queries:

1. `SELECT id FROM students`

2. `SELECT id FROM books`

and get results from the second query which do not result from the first query

For such use case, SQL provides a clause called `EXCEPT`, which helps display difference between the results of two queries.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT id
FROM books
EXCEPT
SELECT id
FROM students
</code>
</codeblock>

Notice that we get only ids 26 to 34 in the results. `students` have ids ranging from 1 to 25, `books` have ids ranging from 1 to 34. The difference of ids is 26 to 34, and that's what the result of `EXCEPT` query above displays.
