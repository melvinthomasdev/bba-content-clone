Find the maximum age among all the students.

We can use another aggregate function `MAX` to solve this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT MAX(age)
FROM students
</code>
</Editor>

`MAX` returns the maximum of all the not-null values in the column mentioned next to it.
