Find id, name and grade of all students, and order them by grade in descending order first and then
sort them in ascending order of id.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT id, name, grade
FROM students
ORDER BY grade DESC, id ASC
</solution>
</codeblock>