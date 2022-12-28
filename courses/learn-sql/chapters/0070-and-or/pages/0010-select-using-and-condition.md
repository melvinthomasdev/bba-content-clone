Find all students whose
_age is greater than 10_
and they are enrolled in the _JavaScript course_.

We can use `AND` operator to combine the two conditions.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE age > 10
AND course = 'JavaScript'
</code>
</codeblock>