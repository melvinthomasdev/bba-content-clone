Find first 10 students with highest marks from the students table.

We can order students by their marks using `ORDER BY`.
We can pick the top 10 students by adding `LIMIT` to `ORDER BY`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
ORDER BY marks DESC
LIMIT 10
</code>
</codeblock>