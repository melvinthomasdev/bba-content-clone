Write a query to display the names of all students who are enrolled in a valid course that has at least one book that belongs to it, and the year of publishing of the oldest book that belongs to the course the student is enrolled in, for each student.

Set the headers for the name of student and the oldest year of publishing as `student` and `oldestPublishingYear` respectively.

At the end, make sure that the results are sorted in

1. the ascending order of oldestPublishingYear, and
2. the alphabetical order of students' name.




<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
ON
GROUP BY
ORDER BY
</code>

<solution>
SELECT   students.name AS student,
         MIN(books.publishedIn) AS oldestPublishingYear
FROM     students JOIN courses JOIN books
ON       students.courseId = courses.id AND
         books.courseId = courses.id
GROUP BY students.name
ORDER BY oldestPublishingYear, students.name
</solution>
</codeblock>