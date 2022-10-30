Find the count of distinct grades and name it `countOfDistinctGrades`.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT COUNT(grade)
FROM students
</code>

<solution>
SELECT COUNT(distinct grade) AS countOfDistinctGrades
FROM students
</solution>
</Editor>