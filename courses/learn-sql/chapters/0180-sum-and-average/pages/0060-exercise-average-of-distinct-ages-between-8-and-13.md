Find the average of all distinct ages of students who are of age between 8 and 13.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT AVG(distinct age)
FROM students
WHERE age between 8 and 13
</solution>
</codeblock>