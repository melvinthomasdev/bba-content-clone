Find name, marks and age of all students, and order them by age in ascending order first and then
sort them in descending order of marks.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, marks, age
FROM students
ORDER BY age ASC, marks DESC
</code>
</codeblock>