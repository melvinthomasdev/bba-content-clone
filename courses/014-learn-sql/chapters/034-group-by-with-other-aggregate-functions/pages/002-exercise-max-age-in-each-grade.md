Find all grades and the maximum age of students in each grade.
The column header for "maximum age" should be `maxAge`.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT grade, MAX(age) AS maxAge
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</solution>
</Editor>