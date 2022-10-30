We've written a query to find all distinct courses.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT DISTINCT(course)
FROM students
</code>
</Editor>

We've also Noted how to find the count of all courses.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT COUNT(course)
FROM students
</code>
</Editor>

Let's combine the above two cases to find the count of all distinct courses.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT COUNT(distinct course)
FROM students
</code>
</Editor>