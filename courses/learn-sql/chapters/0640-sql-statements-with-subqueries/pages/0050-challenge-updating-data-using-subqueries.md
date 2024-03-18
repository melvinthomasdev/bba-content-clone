Write a set of SQL statements to perform the following in the `books` table below

1. Add a new column `avgPrice` to `books`, with data type `INTEGER` and no constraints.

2. Update the `avgPrice` for each row of books to be the average price of all the books published by the same publisher. For example, if there are 3 books published by a publisher `A`, with prices 300, 600 and 900 respectively, the `avgPrice` next to all these books should display AVG(300, 600, 900), i.e. 600.

`Note:` You might have to use an UPDATE statement with a correlated subquery on the same table. Use `table aliases` in the subquery for comparison with the outer statement.



<codeblock language="sql" dbName="students3-v4.db" focusTableAfterRun="books" type="exercise" testMode="fixedInput">
<code>
ALTER TABLE
</code>

<solution>
ALTER TABLE books
ADD COLUMN  avgPrice INTEGER;

UPDATE books
SET    avgPrice = (
                    SELECT AVG(price)
                    FROM   books b2
                    WHERE  b2.publisherName = books.publisherName
                  );
</solution>
</codeblock>