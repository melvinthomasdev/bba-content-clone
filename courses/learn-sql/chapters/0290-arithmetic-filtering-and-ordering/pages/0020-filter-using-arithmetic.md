List the names, ages and marks of students where the sum of age and marks is between 30 and 70.

We can use arithmetic operations in `WHERE` clause.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, age, marks
    FROM students
    WHERE age + marks BETWEEN 30 AND 70
</code>
</codeblock>