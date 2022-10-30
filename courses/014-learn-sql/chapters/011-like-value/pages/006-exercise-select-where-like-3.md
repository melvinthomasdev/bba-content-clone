Find all students who are enrolled in a course that contains `y`.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE course LIKE '%y%'
</solution>
</Editor>