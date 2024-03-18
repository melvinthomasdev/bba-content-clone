Write a query to list the `name`s of `books` for which the `next volume was published within 1 year of their publishing year`. Set the header for the single column of results, to be `name`.

`Note:` Even if you find other ways of doing it, try doing it using EXISTS operator in a subquery, just for the sake of your better understanding of the topic.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
WHERE
</code>

<solution>
SELECT       name
FROM         books outerBooks
WHERE EXISTS (
                SELECT id
                FROM   books innerBooks
                WHERE  innerBooks.id = outerBooks.nextVolumeId AND
                       innerBooks.publishedIn - outerBooks.publishedIn <= 1
             )
</solution>
</codeblock>