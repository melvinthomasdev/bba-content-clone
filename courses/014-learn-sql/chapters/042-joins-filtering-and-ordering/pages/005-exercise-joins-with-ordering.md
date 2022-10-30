Write a query to display the name and year of publishing of all books along with the name of their author. Display them in the reverse order of the year of their publishing first, and for the books published in same year, sort them in the alphabetical order of the names of the authors.

Set the headers for the name of book, year of publishing and name of authors as `book, publishedIn and author` respectively.




<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
ON
ORDER BY
</code>

<solution>
SELECT   books.name AS book,
         publishedIn,
         authors.name AS author
FROM     books LEFT JOIN authors
ON       books.authorId = authors.id
ORDER BY publishedIn DESC, authors.name
</solution>
</Editor>