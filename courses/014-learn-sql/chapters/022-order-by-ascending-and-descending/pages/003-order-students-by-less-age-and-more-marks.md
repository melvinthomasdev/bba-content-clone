Find name, marks and age of all students, and order them by age in ascending order first and then
sort them in descending order of marks.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, marks, age
FROM students
ORDER BY age ASC, marks DESC
</code>
</Editor>