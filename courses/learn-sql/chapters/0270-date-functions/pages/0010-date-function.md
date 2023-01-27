Let's say we want to display today's date.

We can do this using a function
called DATE.

<codeblock language="sql" dbName="students1.db" type="lesson" cache="false">
<code>
SELECT DATE('Now')
</code>
</codeblock>

Let's use the DATE function to display today's date along with the name and course of all students.

<codeblock language="sql" dbName="students1.db" type="lesson" cache="false">
<code>
SELECT name, course, DATE('Now') AS dateToday
FROM   students
</code>
</codeblock>
