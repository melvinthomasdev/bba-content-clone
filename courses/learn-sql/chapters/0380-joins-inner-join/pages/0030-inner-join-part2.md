Let's notice a few more points in the basic `JOIN` query.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
<code>
SELECT students.name, courses.name
FROM   students JOIN courses
ON     students.courseId = courses.id
</code>
</codeblock>

Notice that the number of students is 25 in the students table.
The number of records in the result of  `JOIN` query is only 22.
Here are the reasons.

* 2 students (with id 15 and 31) do not have a `courseId` data.

* 1 student (with id 24) has a `courseId` (20) which does not match any `id` in the `courses` table.

These three students are not included in the final result of the `JOIN` query.

These kinds of joins are also called `INNER JOIN`. In `INNER JOIN` only those rows are included which
strictly match the criteria. The criteria for this query is that the courseId of the student should match with the Id in the courses table.

We can replace `JOIN` in the above query with `INNER JOIN`, and Note that the results still remain the same.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
<code>
SELECT students.name,
       courses.name
FROM   students INNER JOIN courses
ON     students.courseId = courses.id
</code>
</codeblock>