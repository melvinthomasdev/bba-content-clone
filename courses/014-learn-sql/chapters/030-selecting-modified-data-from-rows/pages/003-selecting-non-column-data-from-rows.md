Let's say we want to attach some data which is not necessarily dependent on table data to an existing query.
For example let's say we want to add the same teacher information to a list of name and courses of all students who are enrolled in the Python course.

In this case, we can directly select a `string/number/boolean` for a particular named column, in place of an actual column data.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, course, 'Jonathan Osterman' AS teacher
FROM students
WHERE course = 'Python'
</code>
</Editor>