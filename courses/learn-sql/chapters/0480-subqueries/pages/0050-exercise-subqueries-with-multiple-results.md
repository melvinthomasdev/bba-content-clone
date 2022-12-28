Write a query to display name and publisherName of all such books which are published by a publisher who have worked with at least 3 distinct authors (i.e. the total number of distinct authors who have written a book with that publisher are 3 or more). Set the respective headers as `book` and `publisherName` respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
WHERE
</code>

<solution>
SELECT  name AS book,
        publisherName
FROM    books
WHERE   publisherName IN  (
                            SELECT   publisherName
                            FROM     books JOIN authors
                            ON       books.authorId = authors.id
                            GROUP BY publisherName
                            HAVING   COUNT(DISTINCT authors.id) >= 3   
                        )
</solution>
</codeblock>