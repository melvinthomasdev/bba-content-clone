Let's find maximum marks obtained by students in each grade.
We need to use `MAX` along with `GROUP BY`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT grade, MAX(marks)
FROM students
WHERE grade IS NOT NULL
GROUP BY grade
</code>
</codeblock>