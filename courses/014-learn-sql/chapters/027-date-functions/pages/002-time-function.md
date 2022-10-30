Like DATE function, if we want to get the current time, we can use a TIME function.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT TIME('Now')
</code>
</Editor>

Let's use the TIME function to display current time along with the name of all students.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, TIME('Now') AS currentTime
FROM   students
</code>
</Editor>