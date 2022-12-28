Let's say the task is to display id and name of students who have are enrolled in a course that exists along with the id and name of the courses. The following query would work.

<codeblock language="sql" dbName="students2-v2.db" type="lesson">
<code>
SELECT  students.id AS studentId,
        students.name AS studentName,
        courses.id AS courseId,
        courses.name AS courseName
FROM    students JOIN courses
ON      students.courseId = courses.id
</code>
</codeblock>

However, the repetition of the table names in `SELECT` list and `ON` clause can be reduced by aliasing the table names themselves, and then using the aliases to point out the columns themselves.

<codeblock language="sql" dbName="students2-v2.db" type="lesson">
<code>
SELECT  s.id AS studentId,
        s.name AS studentName,
        c.id AS courseId,
        c.name AS courseName
FROM    students s JOIN courses c
ON      s.courseId = c.id
</code>
</codeblock>

Note that we have aliased the tables `students` and `courses` to `s` and `c` respectively in the `JOIN` list, and then we have used those aliases in `SELECT` and `ON` clauses.