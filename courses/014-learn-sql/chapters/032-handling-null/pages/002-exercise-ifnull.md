Write a query to display the name, age and course of all students. For students not having an age information, display `-`. For students not having a course information, display `Not Enrolled`.

Set the headers as `name`, `age` and `course` respectively.


<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT name,
       IFNULL(age, '-') AS age,
       IFNULL(course, 'Not Enrolled') AS course
FROM students
</solution>
</Editor>