Write an SQL query to display the name of all unique male authors (gender equals M) who have written 3 or more books, with the number of books authored for each of them. 

Set the headers for name of authors, and count of books as `author` and `booksAuthored` respectively.




<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
ON
WHERE
GROUP BY
HAVING
</code>

<solution>
SELECT   authors.name AS author,
         COUNT(books.id) AS booksAuthored
FROM     books JOIN authors
ON       books.authorId = authors.id
WHERE    authors.gender = 'M'
GROUP BY authors.name
HAVING   booksAuthored >= 3
</solution>
</codeblock>