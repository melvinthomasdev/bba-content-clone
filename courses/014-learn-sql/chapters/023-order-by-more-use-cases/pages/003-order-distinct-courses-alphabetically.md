Find all distinct courses students are enrolled in and sort them in the alphabetical order.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT distinct course AS distinctCourse
FROM students
ORDER BY distinctCourse
</code>
</Editor>

This means `ORDER BY` can also be used on modified data (in this case distinctCourse) from one or more columns, and not just on the columns themselves.