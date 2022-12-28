Find all students whose
_age is greater than 15_
or
_they are enrolled in the Java course_
or
_they belong to grade 7_.


We can use `OR` operator to combine the three conditions.
If one of the conditions is true then that record
will be selected since we are using `OR` operator.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE age > 15
OR course = 'Java'
OR grade = 7
</code>
</codeblock>