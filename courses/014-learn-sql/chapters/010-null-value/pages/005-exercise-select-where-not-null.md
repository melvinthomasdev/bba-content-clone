Find all students who have both _age information_ and _course_ information.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE course IS NOT NULL
AND age IS NOT NULL
</solution>
</Editor>