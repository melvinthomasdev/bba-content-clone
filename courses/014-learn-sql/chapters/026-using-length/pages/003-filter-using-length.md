Find unique course names which are of length 4.

In this case, LENGTH can be used in `WHERE` clause as a filter.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT DISTINCT course
FROM students
WHERE LENGTH(course) = 4
</code>
</Editor>