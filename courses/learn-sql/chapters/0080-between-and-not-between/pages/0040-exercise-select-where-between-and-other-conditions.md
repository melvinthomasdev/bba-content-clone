Find all the students who are of _age between 1 and 7_
or
_they belong to grade less than 6_.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE (age BETWEEN 1 and 7) OR (grade < 6)
</solution>
</codeblock>