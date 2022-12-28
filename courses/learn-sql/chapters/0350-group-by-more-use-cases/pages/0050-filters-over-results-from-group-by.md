Once again, let's revisit the original query we wrote to count the number of students in each grades.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) as countOfStudents
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</code>
</codeblock>

Now suppose we want the results filtered only for grades which have more than 2 students.

On the first observation, this looks like the right place to use `WHERE` to filter using `countOfStudents > 2` or `COUNT(*) > 2` as a parameter. Go ahead and run the next query.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) as countOfStudents
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
WHERE countOfStudents > 2
</code>
</codeblock>

Yes! We get a syntax error. That's because `WHERE` is not the right syntax to use for filtering over the aggregate functions or their aliases over groups.

For such cases, SQL provides another filter clause called `HAVING`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, COUNT(*) as countOfStudents
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
HAVING countOfStudents > 2
</code>
</codeblock>

So, we can use `HAVING` to filter the results that are obtained from `GROUP BY` clause.