Let's say we want to display the number of unique authors that have written a book for each course.

One way of doing it would be using a complex JOIN query

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT   courses.name,
         COUNT(DISTINCT authorId)

FROM     courses JOIN books
ON       books.courseId = courses.id

WHERE    courseId IS NOT NULL
GROUP BY courseId
</code>
</Editor>

Another way of doing this is by using a subquery in JOIN clause.

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT   courses.name, 
         booksSummary.authorsCount
FROM     courses JOIN (
                        SELECT   courseId,
                                 COUNT(DISTINCT authorId) as authorsCount
                        FROM     books
                        WHERE    courseId IS NOT NULL
                        GROUP BY courseId
                      ) AS booksSummary
ON       courses.id = booksSummary.courseId
</code>
</Editor>

Notice, that in the above query, the subquery in the JOIN clause creates a link between courseId and count of distinct authorIds. Then it is joined with the name of courses using courseId as a link. This means the subquery can be individually calculated first and then be worked upon later.

Sometimes, when there is an expected use of results of a subquery, we can create them separate using an SQL property called VIEWs. Notice the set of statements below.

<Editor lang="sql" dbName="students2-v3.db">
<code>
CREATE VIEW booksSummary AS
SELECT      courseId,
            COUNT(DISTINCT authorId) as authorsCount
FROM        books
WHERE       courseId IS NOT NULL
GROUP BY    courseId;

SELECT   courses.name, 
         booksSummary.authorsCount
FROM     courses JOIN booksSummary
ON       courses.id = booksSummary.courseId
</code>
</Editor>

Notice that we abstract the results of the first query in a VIEW called booksSummary. The same VIEW can be used as a table later in any kind of query/statement.

Run the statements below to see what is saved in the booksSummary VIEW.

<Editor lang="sql" dbName="students2-v3.db">
<code>
CREATE VIEW booksSummary AS
SELECT      courseId,
            COUNT(DISTINCT authorId) as authorsCount
FROM        books
WHERE       courseId IS NOT NULL
GROUP BY    courseId;

SELECT *    FROM booksSummary;
</code>
</Editor>