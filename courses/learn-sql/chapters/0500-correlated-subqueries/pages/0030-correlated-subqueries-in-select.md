Let's say we want to display the `year of publishing of the oldest published book` that belongs to each course, with the `name of the course` itself.

There is one way of doing it using `JOIN`s.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT    courses.name,
          MIN(books.publishedIn) AS oldestBookpublishedIn
FROM      courses LEFT JOIN books
ON        books.courseId = courses.id
GROUP BY  courses.id
</code>
</codeblock>

However, there is another way of doing it, using a subquery in the `SELECT` clause.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT    courses.name,
          (
              SELECT MIN(publishedIn)
              FROM   books
              WHERE  books.courseId = courses.id
          ) AS oldestBookpublishedIn
FROM      courses
</code>
</codeblock>

This explains that a subquery that can return either a single value, or a list of values, can also substitute a field or part of a field in `SELECT` column.

Notice that the filter in the subquery utilizes a column from the outer/parent query. So this, is also an example of a `correlated subquery`.