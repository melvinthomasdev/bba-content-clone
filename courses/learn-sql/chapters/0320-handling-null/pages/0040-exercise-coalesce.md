Write a query to display the id and name of all students. Also display the first not-null value out of course, age and grade for all students.

Set the headers as `id`, `name` and `course/age/grade`.


<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT id,
       name,
       COALESCE(course, age, grade) AS "course/age/grade"
FROM students
</solution>
</codeblock>