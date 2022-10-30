Let's revisit the original query we wrote to count the number of students in each grades.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT grade, COUNT(*) as count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</code>
</Editor>

Let's say we want to get the same results sorted in the descending order of count of students in each grade.

For this case the aggregate function that we use to get individual result from a group (in this case, COUNT) can also be used in `ORDER BY clause`.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT grade, COUNT(*) as count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
ORDER BY COUNT(*) DESC
</code>
</Editor>

Additionally, the same query can be written like this:

<Editor lang="sql" dbName="students1.db">
<code>
SELECT grade, COUNT(*) as count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
ORDER BY count DESC
</code>
</Editor>

If you notice, the alias used for the aggregate function itself can be used in the `ORDER BY` clause as well, in place of the aggregate function itself.