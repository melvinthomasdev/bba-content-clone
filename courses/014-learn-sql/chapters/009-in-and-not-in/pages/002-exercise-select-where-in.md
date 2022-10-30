Find all the students who _are enrolled in Python, JavaScript or C# course_.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE course IN ('Python', 'JavaScript', 'C#')
</solution>
</Editor>