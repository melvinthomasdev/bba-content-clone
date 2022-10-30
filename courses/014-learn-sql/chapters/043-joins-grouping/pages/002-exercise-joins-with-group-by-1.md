Write a query to display the names of all authors and the number of books authored by them.

Set the headers for the name of authors and number of books written as `author` and `books` respectively.




<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
ON
GROUP BY
</code>

<solution>
SELECT   authors.name AS author, 
         COUNT(books.name) AS books
FROM     authors LEFT JOIN books
ON       books.authorId = authors.id
GROUP BY authors.name
</solution>
</Editor>