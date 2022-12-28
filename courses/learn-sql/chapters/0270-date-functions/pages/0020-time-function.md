Like DATE function, if we want to get the current time, we can use a TIME function.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT TIME('Now')
</code>
</codeblock>

Let's use the TIME function to display current time along with the name of all students.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, TIME('Now') AS currentTime
FROM   students
</code>
</codeblock>