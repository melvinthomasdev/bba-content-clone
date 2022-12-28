Let's see what happens if we skip the `ON` clause from a simple `JOIN` query, where we want to display name of students and name of courses.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT  students.name AS student,
        courses.name AS course
FROM    students JOIN courses
</code>
</codeblock>

Notice the result. It is comprised of all possible combinations of a student and a course. So each of the `25` `students`, is paired with each of the `13` `courses`, producing a total of `25 * 13 = 325` rows in the results. This kind of a result, which produces all possible combinations of results from two or more tables, in the absence of a matching criteria, (in this case, an `ON` clause) is called a `CARTESIAN PRODUCT`.

Let's turn the above feature into a problem we can solve. Let's say we want to display all possible combinations of student names and course names, and a boolean result (0/1) against each combination if the student is enrolled in the course.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT  students.name AS student,
        courses.name AS course,
        students.courseId = courses.id AS enrolled
FROM    students JOIN courses
</code>
</codeblock>