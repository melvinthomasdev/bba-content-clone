Find the total number of names of all the students.

Instead of `COUNT(*)` we can use `COUNT(name)` to solve this problem.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(name)
FROM students
</code>
</codeblock>

The total number of students is 18.

It's not obvious but if we are not using `*` then sql by default adds `ALL`.
Let's see the same code with `ALL`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(ALL name)
FROM students
</code>
</codeblock>

Besides `ALL` the other option is to use `DISNTICT`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(DISTINCT name)
FROM students
</code>
</codeblock>




The result of `COUNT` query is also 18.

Let's count total number of courses.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(course)
FROM students
</code>
</codeblock>

This time we got 17 in result.

So why the difference.

That's because one student(Hugh) does not have any course.
For that student the value of course is null.

`COUNT` does not count null values.