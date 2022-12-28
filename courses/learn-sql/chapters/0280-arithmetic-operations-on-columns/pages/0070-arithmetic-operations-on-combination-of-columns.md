Arithmetic operations can be applied to get data from a combination of columns too.

Let's say we want to get the sum of age and grade for all students.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT age + grade
FROM students
</code>
</codeblock>

Think what should the result be if either age or grade is null for any student.