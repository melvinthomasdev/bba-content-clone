Find the average of all distinct ages of students who are of age between 8 and 13.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT AVG(distinct age)
FROM students
WHERE age between 8 and 13
</solution>
</Editor>