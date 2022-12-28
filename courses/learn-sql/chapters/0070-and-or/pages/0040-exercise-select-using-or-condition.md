Find all students who are either
_less than or equal to 7 years of age_
or
_they are enrolled in the Ruby course_.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT *
FROM students
WHERE course = 'Ruby'
OR age <= 7
</solution>
</codeblock>