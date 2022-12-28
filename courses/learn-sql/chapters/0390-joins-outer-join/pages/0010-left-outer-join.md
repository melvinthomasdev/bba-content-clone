Let's say we want to display the name of all students and the names of the courses they are enrolled in if they are enrolled in a course.

Notice the results if we use an INNER JOIN.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
<code>
SELECT students.name AS studentName,
       courses.name AS courseName
FROM   students INNER JOIN courses
ON     students.courseId = courses.id
</code>
</codeblock>

There are only 22 records in the final result. It does not contain students who are either enrolled in an invalid course, or are not enrolled in a course.

This is a problem that can be solved using an `OUTER JOIN`, specifically the `LEFT OUTER JOIN`.

An `OUTER JOIN` is a JOIN that also returns records that are unmatched from the criteria in `ON` clause, along with the ones that match.

A `LEFT OUTER JOIN` or a `LEFT JOIN` returns records from the table at left in the JOIN, that are unmatched from the connecting query in `ON`, along with the matched records.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
<code>
SELECT students.name AS studentName,
       courses.name AS courseName
FROM   students LEFT JOIN courses
ON     students.courseId = courses.id
</code>
</codeblock>

Note that the table `students` is at the left in the `LEFT JOIN` clause, so `all records` from the `students` table appear in the result. For the students who don't have a course in which they are enrolled in, the course name is returned as blank.