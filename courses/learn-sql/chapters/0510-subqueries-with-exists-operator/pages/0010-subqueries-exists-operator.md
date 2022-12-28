Let's say we want to show names of students who are enrolled in courses that have at least 1 book that belong to them.

This problem asks for selecting records from a table on the basis that whether there is at least one record existing with a certain condition related to the original table.

SQL provides an operator called `EXISTS` with subqueries, that serves the exact same use case. Have a look at the query below.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT       name
FROM         students
WHERE EXISTS (
                SELECT  id
                FROM    books
                WHERE   courseId = students.courseId
             )
</code>
</codeblock>

Note, that the query results does not include students, who do not have any course information. They also do not include students who are enrolled in courses such as `Swift` and `SQL`, which have no books that belong to them.

Notice that the `EXISTS` operator here works as a boolean filter. If there is at least one record that gets returned from the subquery, the operator returns `true`, otherwise it returns `false`.



