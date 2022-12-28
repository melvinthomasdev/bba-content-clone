Find all students
who _belong to either grade 6, grade 9 OR grade 12_.

We can do this using `OR` operator.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE grade = 6
OR grade = 9
OR grade = 12
</code>
</codeblock>

A simpler way of doing it is using `IN`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE grade IN (6, 9, 12)
</code>
</codeblock>