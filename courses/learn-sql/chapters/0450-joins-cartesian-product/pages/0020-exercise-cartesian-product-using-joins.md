Write a query to display all the combinations of book names and author names, and for each combination, display a boolean value (0/1) that shows whether the book is written by the author.

Set the headers for the name of book, name of author and boolean for whether the book was authored by the writer as `book`, `author` and `authored` respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
</code>

<solution>
SELECT  books.name AS book,
        authors.name AS author,
        books.authorId = authors.id AS authored
FROM    books JOIN authors
</solution>
</codeblock>