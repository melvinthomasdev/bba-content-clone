Find name and marks of all students with their respective marks in descending order.

We can add `DESC` to the name of the column in `ORDER BY` clause to achieve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, marks
FROM students
ORDER BY marks DESC
</code>
</codeblock>

`DESC` is the SQL syntax equivalent of `DESCENDING`.
Similarly, to sort the same data in ascending order, we can add `ASC` to the name of the column in `ORDER BY`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, marks
FROM students
ORDER BY marks ASC
</code>
</codeblock>

Mentioning `ASC` is optional, as the default order of sorting in SQL is `ascending`, unless specified explicitly.
