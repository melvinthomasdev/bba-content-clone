Find all students _who do not belong to grade 2, 3, 5, 7 or 11_.

We can do this using `OR` operator.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE grade = 1
OR grade = 4
OR grade = 6
OR grade = 8
OR grade = 9
OR grade = 10
OR grade = 12
</code>
</codeblock>

A simpler and shorter way of doing it is by using `NOT IN`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE grade NOT IN (2, 3, 5, 7, 11)
</code>
</codeblock>

We can see that `NOT IN` does exactly the opposite of what `IN` does.