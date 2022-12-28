Write a query to display the names of all courses followed by these 4 data items:

1. maximum marks scored by students in the course

2. minimum marks scored by students in the course

3. sum of all marks scored by students in the course

4. average of marks scored by students in the course
<br><br>

Set the headers for the 5 columns as `courseName`, `maximumMarks`, `minimumMarks`, `sumOfMarks` and `averageMarks` respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
ON
GROUP BY
</code>

<solution>
SELECT   courses.name AS courseName, 
         MAX(students.marks) AS maximumMarks,
         MIN(students.marks) AS minimumMarks,
         SUM(students.marks) AS sumOfMarks,
         AVG(students.marks) AS averageMarks
FROM     courses LEFT JOIN students
ON       students.courseId = courses.id
GROUP BY courses.name
</solution>
</codeblock>