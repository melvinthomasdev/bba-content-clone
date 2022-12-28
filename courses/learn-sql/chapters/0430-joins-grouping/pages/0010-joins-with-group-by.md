Let's say we want to display the names of all unique courses and the total number of students enrolled in each course.

In this case, we can use `COUNT` over `GROUP BY` clause for the number of students, over the `JOIN` of tables `students` and `courses`.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT   courses.name AS course, 
         COUNT(students.name) AS numberOfStudents
FROM     students JOIN courses
ON       students.courseId = courses.id
GROUP BY courses.name
</code>
</codeblock>

Take a close look at the results, not all courses are included in the records. Course `C`, that does not have any students enrolled in it, doesn't show up. We need to use a `LEFT OUTER JOIN`/`LEFT JOIN` in this case, keeping `courses` at the left, so that all the records from courses show up, irrespective of matching records from the table at the right.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT   courses.name AS course, 
         COUNT(students.name) AS numberOfStudents
FROM     courses LEFT JOIN students
ON       students.courseId = courses.id
GROUP BY courses.name
</code>
</codeblock>