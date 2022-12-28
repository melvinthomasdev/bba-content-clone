Find all students
who
_belong to grade 6 or 7_
and
_they are enrolled in either Python or JavaScript course_.

We need to use both `AND` as well as `OR` to solve this problem.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE (grade = 6 OR grade = 7)
AND ( course = 'Python'
      OR course = 'JavaScript')
</code>
</codeblock>