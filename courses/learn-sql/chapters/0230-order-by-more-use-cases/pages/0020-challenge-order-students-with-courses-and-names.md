Find id, course and name of students, in the alphabetical order of courses they are enrolled in, and
then sort in reverse alphabetical order of their names.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT id, course, name
FROM students
ORDER BY course, name DESC
</solution>
</codeblock>