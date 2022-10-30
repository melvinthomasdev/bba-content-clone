Find all students _who do not belong to grade 2, 3, 5, 7 or 11_.

We can do this using `OR` operator.

<Editor lang="sql" dbName="students1.db">
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
</Editor>

A simpler and shorter way of doing it is by using `NOT IN`.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE grade NOT IN (2, 3, 5, 7, 11)
</code>
</Editor>

We can see that `NOT IN` does exactly the opposite of what `IN` does.