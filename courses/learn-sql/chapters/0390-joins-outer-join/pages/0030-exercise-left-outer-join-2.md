Let's say we have a new table called `authors`. There are various columns in `authors` like `id`, `name`, `gender` etc.

There is a column `authorId` in the existing `books` table, which is a reference to the `id` in existing `authors` table. What it means is, each book is written by an `author` that exists in `authors` table, referenced by the `authorId`.

Write a query to display the name and price of all books, and the names of authors of books for each of them if there is an author information available for a book.

The headers for the name of books, price of books, and name of author should be `bookName`, `price` and `authorName` respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" focusTableBeforeRun="authors" testMode="fixedInput">
<code>
SELECT 
FROM
ON
</code>

<solution>
SELECT books.name AS bookName,
       price,
       authors.name AS authorName
FROM   books LEFT JOIN authors
ON     books.authorId = authors.id
</solution>
</codeblock>