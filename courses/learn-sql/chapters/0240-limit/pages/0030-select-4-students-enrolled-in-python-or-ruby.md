Find top 4 students enrolled in either Python or Ruby course.

We can combine a `WHERE` condition with `LIMIT` to get this result.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE course IN ('Python', 'Ruby')
LIMIT 4
</code>
</codeblock>