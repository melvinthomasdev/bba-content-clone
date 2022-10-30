Write a query to list the `name`s of `authors` who have written `at least one book which was published either in 2010 or earlier`. Set the header for the single column of results, to be `name`.

`Note:` Even if you find other ways of doing it, try doing it using EXISTS operator in a subquery, just for the sake of your better understanding of the topic.



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
</code>

<solution>
SELECT       name
FROM         authors
WHERE EXISTS (
                SELECT id
                FROM   books
                WHERE  publishedIn <= 2010 AND
                       authorId = authors.id
             )
</solution>
</Editor>