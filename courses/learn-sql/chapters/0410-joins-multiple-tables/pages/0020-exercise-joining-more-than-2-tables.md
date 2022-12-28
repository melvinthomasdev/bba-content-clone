Write a query to display the name of all the students who have a student mentor, the name of the course they are enrolled in, along with the name of the student who is their student mentor, and the course the student mentor is enrolled in.

The headers for the name of student, name of the course, name of the student mentor, and name of the course student mentor is enrolled in should be `studentName`, `courseName`, `mentorName` and `mentorCourseName` respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
ON
</code>

<solution>
SELECT  s1.name AS studentName,
        c1.name AS courseName,
        s2.name AS mentorName,
        c2.name AS mentorCourseName
FROM    students s1 JOIN students s2 JOIN courses c1 JOIN courses c2
ON      s1.studentMentorId = s2.id AND
        s1.courseId = c1.id AND
        s2.courseId = c2.id
</solution>
</codeblock>