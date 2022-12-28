Let's revisit the original query we wrote to count the number of students in each grades.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) as count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</code>
</codeblock>

Let's say we want to get the same results sorted in the descending order of count of students in each grade.

For this case the aggregate function that we use to get individual result from a group (in this case, COUNT) can also be used in `ORDER BY clause`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) as count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
ORDER BY COUNT(*) DESC
</code>
</codeblock>

Additionally, the same query can be written like this:

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) as count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
ORDER BY count DESC
</code>
</codeblock>

If you notice, the alias used for the aggregate function itself can be used in the `ORDER BY` clause as well, in place of the aggregate function itself.