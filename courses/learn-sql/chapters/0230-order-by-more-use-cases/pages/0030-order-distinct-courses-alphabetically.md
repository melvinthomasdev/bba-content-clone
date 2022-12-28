Find all distinct courses students are enrolled in and sort them in the alphabetical order.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT distinct course AS distinctCourse
FROM students
ORDER BY distinctCourse
</code>
</codeblock>

This means `ORDER BY` can also be used on modified data (in this case distinctCourse) from one or more columns, and not just on the columns themselves.