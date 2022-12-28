The COUNT function is used to count the number of rows.

Let's find the total number of students.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(*)
FROM students
</code>
</codeblock>

Here we are using **\*** to indicate that we want to count
all students.

`COUNT` is the first of **aggregate functions** we will see in this course.
An **aggregate function** is used to perform some calculations on data.
Count, average, sum, maximum and minimum are examples of aggregate function.