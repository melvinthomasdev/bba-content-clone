Let's say we want to display names and marks of students along with the name of the courses they are enrolled in, in the alphabetical order of the course names first, and then in the increasing order of marks scored by them.

In this case, we can add ordering to the `JOIN` result of `students` and `courses` with an `ORDER BY` clause.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT   students.name AS studentName,
         courses.name AS courseName,
         marks
FROM     students JOIN courses
ON       students.courseId = courses.id
ORDER BY courses.name, marks
</code>
</codeblock>