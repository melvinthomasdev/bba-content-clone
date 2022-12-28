Find the sum of all distinct marks under 50 and name it `sumOfDistinctMarks`.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT SUM(DISTINCT marks) AS sumOfDistinctMarks
FROM students
WHERE marks < 50
</solution>
</codeblock>