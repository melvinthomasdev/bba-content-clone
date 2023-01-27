Like DATE function, if we want to get the current time, we can use a TIME function.

<codeblock language="sql" dbName="students1.db" type="lesson" cache="false">
<code>
SELECT TIME('Now')
</code>
</codeblock>

Let's use the TIME function to display current time along with the name of all students.

<codeblock language="sql" dbName="students1.db" type="lesson" cache="false">
<code>
SELECT name, TIME('Now') AS currentTime
FROM   students
</code>
</codeblock>

Note: In this editor, the time shown with `'Now'` will show the current time in `UTC` time zone, as the queries in Bigbinary Academy is executed on a remote server set in UTC.
