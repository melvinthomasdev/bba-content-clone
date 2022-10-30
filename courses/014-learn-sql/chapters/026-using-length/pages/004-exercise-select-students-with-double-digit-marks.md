List the names and marks of students who have marks in double digits.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT  
FROM
</code>

<solution>
SELECT name, marks
FROM students
WHERE LENGTH(marks) = 2
</solution>
</Editor>