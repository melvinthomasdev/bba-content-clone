Write a query to display the id and name of all students, along with the name of the course they are enrolled in, if its a valid course.

Set the headers for id of student, name of student and name of course as `studentId`, `studentName` and `courseName` respectively.



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
ON
</code>

<solution>
SELECT students.id as studentId,
       students.name AS studentName,
       courses.name AS courseName
FROM   students LEFT JOIN courses
ON     students.courseId = courses.id
</solution>
</Editor>