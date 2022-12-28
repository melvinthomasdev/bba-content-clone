Let's revisit the query we wrote to count the number of students.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(*)
FROM students
</code>
</codeblock>

Let's say if instead of counting all students, we want to count the number of students in each grade.

This involves grouping students as per their grades, and then apply count on each group.

SQL provides clause `GROUP BY` to achieve that.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) AS count
FROM students
GROUP BY grade
</code>
</codeblock>

Note that in the result of above query, there is a row where the `grade` value is `NULL`. That's expected, because even in `GROUP BY` clause, a `NULL` `grade` is still a unique grade.
There are students with a `NULL` `grade`, so they appear in the results of the query.

If we want to skip the results with `NULL` grade, we can filter them out by adding a simple `WHERE` clause.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) AS count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</code>
</codeblock>