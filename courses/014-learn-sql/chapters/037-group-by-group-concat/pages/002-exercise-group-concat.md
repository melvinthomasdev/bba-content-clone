Write a query to list all the unique not-null grades.
For each of these grades,
display all the courses, students of that grade are enrolled in.
Separate the list of courses using a single space (` `).
Set the headers for grades and list of courses as `grade` and `courses` respectively.

<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM students
WHERE
GROUP BY
</code>

<solution>
SELECT grade, GROUP_CONCAT(course, ' ') as courses
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</solution>
</Editor>