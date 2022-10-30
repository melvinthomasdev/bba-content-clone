We want to count the number of students for unique length of names.

In this case, we can use the length of name in the GROUP BY clause to get the result.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT LENGTH(name) AS nameLength, COUNT(*) AS countOfStudents
FROM students
GROUP BY LENGTH(name)
</code>
</Editor>