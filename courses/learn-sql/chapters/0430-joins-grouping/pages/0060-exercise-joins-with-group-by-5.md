Write an SQL query to display the name of all unique courses, and count of books that belong to that course. The names of courses should be in alphabetical order.

Set the headers for name of courses, and count of books as `course` and `books` respectively.

`Note:` Skip courses that do not have any book that belongs to them.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
ON
GROUP BY
</code>

<solution>
SELECT   courses.name AS course,
         COUNT(books.id) AS books
FROM     courses JOIN books
ON       books.courseId = courses.id
GROUP BY courses.name
</solution>
</codeblock>