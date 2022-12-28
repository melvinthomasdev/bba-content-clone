Find the count of distinct grades and name it `countOfDistinctGrades`.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT COUNT(grade)
FROM students
</code>

<solution>
SELECT COUNT(distinct grade) AS countOfDistinctGrades
FROM students
</solution>
</codeblock>