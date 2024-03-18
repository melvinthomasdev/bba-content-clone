Find all the students who _are enrolled in Python, JavaScript or C# course_.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE course IN ('Python', 'JavaScript', 'C#')
</solution>
</codeblock>