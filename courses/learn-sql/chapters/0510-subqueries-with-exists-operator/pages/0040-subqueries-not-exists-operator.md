Let's say we want to get the `list of books that belong to a course which doesn't have any students enrolled in it`.

If we break down the ask in this case, it simply means selecting records from a table with a criteria that no records related to a parameter from that table exists in the results of another query.

This is the exact opposite use case of `EXISTS` and adding a `NOT` before `EXISTS` solves the problem for us. Take a look at the query below.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT           name
FROM             books
WHERE NOT EXISTS (
                    SELECT  id
                    FROM    students
                    WHERE   courseId = books.courseId
                 )
</code>
</codeblock>