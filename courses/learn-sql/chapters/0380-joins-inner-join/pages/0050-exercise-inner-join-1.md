Write a query to display the name and age of all students who are enrolled in a course, along with the name and the abbreviated name of the courses.

The headers for the name of students, age of students, name of course and abbreviated name of course should be `studentName`, `age` and `courseName` and `courseAbbreviatedName` respectively.



<codeblock language="sql" dbName="students2-v1.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
ON
</code>

<solution>
SELECT students.name AS studentName, 
       age,
       courses.name AS courseName,
       abbreviatedName AS courseAbbreviatedName
FROM   students INNER JOIN courses
ON     students.courseId = courses.id
</solution>
</codeblock>