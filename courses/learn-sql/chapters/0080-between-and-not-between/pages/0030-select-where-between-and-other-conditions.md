Find all students
who belong to _grades between 8 and 12_
and
_they are enrolled in course C#_.

We can use `BETWEEN` & `AND` condition to solve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE (grade BETWEEN 8 and 12)
AND (course = 'C#')
</code>
</codeblock>