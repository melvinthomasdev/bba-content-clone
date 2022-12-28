We've written a query to find all distinct courses.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT DISTINCT(course)
FROM students
</code>
</codeblock>

We've also Noted how to find the count of all courses.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(course)
FROM students
</code>
</codeblock>

Let's combine the above two cases to find the count of all distinct courses.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(distinct course)
FROM students
</code>
</codeblock>