Find all students who are enrolled in a course that contains `y`.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE course LIKE '%y%'
</solution>
</codeblock>