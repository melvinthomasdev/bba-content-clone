Write a query to display `name`, `price` and `author's name` for all books which are priced higher than the highest priced book written by the author `Steve Strange`. Set the headers for book name, price and author's name, as `book`, `price` and `author` respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
ON
WHERE
</code>

<solution>
SELECT  books.name AS book,
        price,
        authors.name AS author
FROM    books JOIN authors
ON      books.authorId = authors.id
WHERE   books.price > (
                        SELECT MAX(books.price)
                        FROM   books JOIN authors
                        ON     books.authorId = authors.id
                        WHERE  authors.name = 'Steve Strange'
                      )
</solution>
</codeblock>