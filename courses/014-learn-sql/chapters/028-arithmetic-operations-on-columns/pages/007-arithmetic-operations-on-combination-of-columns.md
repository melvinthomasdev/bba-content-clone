Arithmetic operations can be applied to get data from a combination of columns too.

Let's say we want to get the sum of age and grade for all students.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT age + grade
FROM students
</code>
</Editor>

Think what should the result be if either age or grade is null for any student.