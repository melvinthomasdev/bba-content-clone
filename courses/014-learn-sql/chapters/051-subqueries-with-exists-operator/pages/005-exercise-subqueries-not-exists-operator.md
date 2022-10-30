Write a query to list the `name`s of `courses` that do not have a book published in `2014`. Set the header for the single column of results, to be `name`.

`Note:` Even if you find other ways of doing it, try doing it using NOT EXISTS operator in a subquery, just for the sake of your better understanding of the topic.



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
WHERE
</code>

<solution>
SELECT           name
FROM             courses
WHERE NOT EXISTS (
                    SELECT id
                    FROM   books
                    WHERE  courseId = courses.id AND
                           publishedIn = 2014
                 )
</solution>
</Editor>