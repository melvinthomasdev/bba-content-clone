Display the name, age and grade of students in the ascending order of difference of their age and grade for students who have both age data and grade data.

We can use an arithmetic expression in `ORDER BY` clause to achieve this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, age, grade
FROM students
WHERE age IS NOT NULL AND grade IS NOT NULL
ORDER BY age - grade
</code>
</codeblock>