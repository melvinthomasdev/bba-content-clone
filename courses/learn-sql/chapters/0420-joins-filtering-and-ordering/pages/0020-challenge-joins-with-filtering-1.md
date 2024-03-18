Write a query to display the name and price of all books which are in the price range 100 and 600, written by a female author (gender 'F'), and belong either to the Java course or the PHP course. Also include the name of the course and the name of the author.

The headers for the name of books, price, name of the course, and name of the author should be `bookName`, `price`, `courseName` and `authorName` respectively, and the results should be in this order.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
ON
WHERE
</code>

<solution>
SELECT  books.name AS bookName,
        price,
        courses.name AS courseName,
        authors.name AS authorName
FROM    books JOIN courses JOIN authors
ON      books.authorId = authors.id AND
        books.courseId = courses.id
WHERE   gender = 'F' AND
        price BETWEEN 100 AND 600 AND
        courses.name in ('Java', 'PHP')
</solution>
</codeblock>