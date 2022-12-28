Find the maximum age among all the students.

We can use another aggregate function `MAX` to solve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT MAX(age)
FROM students
</code>
</codeblock>

`MAX` returns the maximum of all the not-null values in the column mentioned next to it.
