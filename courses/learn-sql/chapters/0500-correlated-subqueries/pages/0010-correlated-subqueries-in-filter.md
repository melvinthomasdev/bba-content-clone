Let's say we want to filter out `courses` for which the average price of books belonging to that course is more than 500.

We already know how to do it. Using a `GROUP BY` query to calculate the average, over a `LEFT JOIN` of `courses` and `books`, and then using `HAVING` to filter out the cap over average price of books. Something like the query below:

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT    courses.name
FROM      courses LEFT JOIN books
ON        books.courseId = courses.id
GROUP BY  courses.id
HAVING    AVG(books.price) > 500
</code>
</codeblock>

However there is another way to do it, using a subquery. Have a look at the query below:

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT    name
FROM      courses
WHERE     500 < (
                    SELECT AVG(price)
                    FROM   books
                    WHERE  courseId = courses.id
                )
</code>
</codeblock>

Key thing to notice is the `courses.id` at the right hand side of `WHERE` clause in the subquery. What `courses` does it exactly points to, when there is only `books` in the `FROM` clause? Let's add a few aliases to the query that make it easier to understand.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT    name
FROM      courses AS c
WHERE     500 < (
                    SELECT AVG(price)
                    FROM   books
                    WHERE  books.courseId = c.id
                )
</code>
</codeblock>

Clearly, the `courses.id` or `c.id` at the right hand side of filter in the subquery, is pointing to the `id` from the `parent query` (i.e. the one on `courses`). So, this subquery, calculates the AVG price of all the books that belong to the course, by using the id of the course from the parent query, for each course, and then compares it with 500 to get the final results.

These kind of subqueries, that employ a column/derived column from the parent query they are a part of, are called `correlated subqueries`.

