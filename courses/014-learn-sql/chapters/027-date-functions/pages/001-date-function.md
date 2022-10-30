Let's say we want to display today's date.

We can do this using a function
called DATE.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT DATE('Now')
</code>
</Editor>

Let's use the DATE function to display today's date along with the name and course of all students.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, course, DATE('Now') AS dateToday
FROM   students
</code>
</Editor>