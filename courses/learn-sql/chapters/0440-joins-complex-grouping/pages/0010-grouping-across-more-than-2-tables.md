Let's say we want to display the names of all unique courses and the total number of unique authors who have written books for each course.

In this case, we can use `COUNT` over a `GROUP BY` clause on results of a `LEFT JOIN` across three tables: `courses`, `books` and `authors`. Run the query below.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT   courses.name AS course, 
         COUNT(authors.id) AS numberOfAuthors
FROM     courses LEFT JOIN books LEFT JOIN authors
ON       books.courseId = courses.id AND
         books.authorId = authors.id
GROUP BY courses.name
</code>
</codeblock>

The results look as intended, but if you notice closely, are wrong. Let's look at the `books` table. All books belonging to the `Java` course are written by one and the same author. But our results for the above query for `Java`, show 7. The same is true for a few other courses. Lets understand why is that.

In the above query, we have simply `COUNT`ed the id of authors who are attached to books belonging to a course, say `Java`. There are 7 books that belong to `Java`, and hence the results are also 7, because we don't take into account that all books belonging to `Java` may not be written by `distinct` authors, which is the case.

The solution is taking uniqueness into account while counting the authors, i.e. adding a `DISTINCT` clause to the `COUNT` of author's ids. Run the query below to get the right results.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT   courses.name AS course, 
         COUNT(DISTINCT authors.id) AS numberOfAuthors
FROM     courses LEFT JOIN books LEFT JOIN authors
ON       books.courseId = courses.id AND
         books.authorId = authors.id
GROUP BY courses.name
</code>
</codeblock>

Notice that we are grouping the results from `authors` as a `COUNT`, on the basis of a grouping parameter from `courses` (`name`), two tables which are not directly related. But we are achieving that, by combining them with the help of table that relates to both, `books`.
