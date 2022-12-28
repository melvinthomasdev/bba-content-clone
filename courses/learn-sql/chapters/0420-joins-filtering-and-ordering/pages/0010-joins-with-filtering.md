Let's say we want to display names and marks of students who are enrolled in either JavaScript course or Python course and have marks between 15 and 85, along with the name of the course.

In this case, we can add filter to the `JOIN` result of `students` and `courses` with a `WHERE` clause.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT  students.name AS studentName,
        courses.name AS courseName,
        marks
FROM    students JOIN courses
ON      students.courseId = courses.id
WHERE   courses.name IN ('JavaScript', 'Python') AND
        marks BETWEEN 15 AND 85
</code>
</codeblock>

Note that we can add queries on multiple columns across the tables covered in the join.