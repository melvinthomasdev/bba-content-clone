List the names and marks of students who have marks in double digits.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT name, marks
FROM students
WHERE LENGTH(marks) = 2
</solution>
</codeblock>