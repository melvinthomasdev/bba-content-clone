Find all students for whom either there is _no grade_ information
or there is _no course_ information.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE course IS NULL
OR grade IS NULL
</solution>
</codeblock>