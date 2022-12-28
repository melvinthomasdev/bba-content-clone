Find the name, grade, and marks of students, in the increasing order of grade.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, grade, marks
FROM students
ORDER BY grade
</code>
</codeblock>

For Grade 10 we have three students. Now we want these three students to be sorted based on their marks.
In this case, we can specify multiple columns after `ORDER BY` separated by `,` to get the result.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, grade, marks
FROM students
ORDER BY grade, marks
</code>
</codeblock>

Let's reverse the order of columns mentioned in the `ORDER BY` clause.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, grade, marks
FROM students
ORDER BY marks, grade
</code>
</codeblock>

Notice the difference in results from the earlier query.
The results are sorted in the order of `marks` first and then `grade`.
`ORDER BY` sorts the result in the order in which the column names are mentioned. So the data is first sorted in the order of the first column in the `ORDER BY` list, and then in the order of the second column, and so on.
