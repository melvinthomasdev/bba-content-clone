Let's say, for each book, we want to display the name and prices of books which are costlier than the average price of books published by the same publisher.

The subquery in this case would be to figure out the average price of books for each publisher, something similar to following:

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT    publisherName, AVG(price) AS avgPrice
FROM      books
GROUP BY  publisherName
</code>
</Editor>

However, if we have to integrate it into another query to get the original results we expect, we cannot add it in a `filter`/`WHERE clause`. Why? because the data from the subquery differs for different kind of `books` (different `publisherName`s have different `average` `price`s). It is not a singular result, or a single list of results, which we can compare to records(`price`s of `books`).

Instead, the results of the subquery (average book price) will have to be individually compared with each of our main parameters (book price), based on the `publisherName`. To achieve this, we can treat the subquery as an entirely different table, to be used as part of a JOIN, in FROM clause. Go ahead and run the query below.

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT    books.name, 
          books.price, 
          books.publisherName,
          publisherSummary.avgPrice AS publisherAvgPrice
FROM      books JOIN (
                        SELECT    publisherName, AVG(price) AS avgPrice
                        FROM      books
                        GROUP BY  publisherName
                     ) AS publisherSummary
ON        books.publisherName = publisherSummary.publisherName
WHERE     books.price > publisherSummary.avgPrice
</code>
</Editor>

Notice, that once we treat the results of the subquery as a separate table, and give it an alias (`publisherSummary`), we can use it inside a `JOIN` clause as a standard table. We can also use columns from the subquery in `WHERE` clause and `ON` clause. That's exactly what we do when we use `publisherName` from `publisherSummary` to match with `publisherName` in original `books` in `ON` clause, and then use `avgPrice` from `publisherSummary` to compare with `price`s of original books in `WHERE` clause.