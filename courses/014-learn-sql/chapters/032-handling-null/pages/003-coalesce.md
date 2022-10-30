Let's say we want to display the name of all students with one additional data point.
If age is available, then print it.
If age is not available, then we print the grade value.
If the grade is also NULL, then we print the course value.
If the course value is NULL as well, we return NULL.

This requires selecting first of the not-null values from a list.
SQL provides a `COALESCE` function to achieve this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name,
       COALESCE(age, grade, course) AS "age or grade or course"
FROM students
</code>
</Editor>

Note that `COALESCE` takes a list of values as arguments, and returns the first not-null value from it as a result.
