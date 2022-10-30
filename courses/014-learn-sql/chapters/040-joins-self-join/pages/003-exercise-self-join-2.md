Write a query to display the name of all the students, along with the name of the student who is their student mentor. For students who don't have a student mentor, leave that column in the result blank.

The headers for the name of student, and the name of the student mentor should be `studentName` and `mentorName` respectively.



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
ON
</code>

<solution>
SELECT s1.name AS studentName,
       s2.name AS mentorName
FROM   students s1 LEFT JOIN students s2
ON     s1.studentMentorId = s2.id
</solution>
</Editor>