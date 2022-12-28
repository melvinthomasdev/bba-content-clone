Find unique course names which are of length 4.

In this case, LENGTH can be used in `WHERE` clause as a filter.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT DISTINCT course
FROM students
WHERE LENGTH(course) = 4
</code>
</codeblock>