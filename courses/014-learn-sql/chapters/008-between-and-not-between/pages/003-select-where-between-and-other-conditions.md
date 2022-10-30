Find all students
who belong to _grades between 8 and 12_
and
_they are enrolled in course C#_.

We can use `BETWEEN` & `AND` condition to solve this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE (grade BETWEEN 8 and 12)
AND (course = 'C#')
</code>
</Editor>