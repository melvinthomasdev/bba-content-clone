We want to display all distinct courses.
To highlight that this list is different from all courses list, we want to give it an appropriate name.

We can use `AS` to achieve the goal.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT distinct(course) AS unique_courses
FROM students
</code>
</Editor>

Next, suppose we want to display all ages of students and we want the column header to be _students_age_.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT age AS students_age
FROM students
</code>
</Editor>