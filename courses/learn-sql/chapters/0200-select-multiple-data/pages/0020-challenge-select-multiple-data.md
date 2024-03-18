Let's calculate the minimum marks, the maximum marks and the count of distinct courses and name them as `minMarks`, `maxMarks` and `countOfCourses` respectively.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT MIN(marks) AS minMarks,
MAX(marks) AS maxMarks,
COUNT(DISTINCT course) AS countOfCourses
FROM students
</solution>
</codeblock>