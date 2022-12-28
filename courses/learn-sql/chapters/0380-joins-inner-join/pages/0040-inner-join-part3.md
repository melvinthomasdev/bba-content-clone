Let us revisit the query to get names of students and names of courses they are enrolled in.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
<code>
SELECT students.name,
       courses.name
FROM   students INNER JOIN courses
ON     students.courseId = courses.id
</code>
</codeblock>

Notice that in the headers in the result, both columns show up as `name`. This is because a `JOIN` simply returns the name of the columns as headers by default. Since both the columns expected are `name`s, we can use the familiar `ALIAS` technique to differentiate between the two, and removing the confusion in display.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
<code>
SELECT students.name AS studentName,
       courses.name AS courseName
FROM   students INNER JOIN courses
ON     students.courseId = courses.id
</code>
</codeblock>

Finally, the need to specify the column names with table's name in the `SELECT` clause, is only enforced in case we want to select a column from a table, which has a name same as a column in one of the other tables in the `JOIN` list. For example, in the case given above, the `name` column from `students` conflicts with the `name` column from `courses`. Hence the need to specify `students.name` and `courses.name` for each of them.

However, if one has to select a column which does not have such a conflict with name from a table, one can get away with simply mentioning the column in the `SELECT` list without the table name preceding it. For example, if the task was to list the `name`s of students with the `abbreviatedName` of the courses they are enrolled in, the following query would work fine.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
<code>
SELECT students.name AS studentName,
       abbreviatedName AS courseShortForm
FROM   students INNER JOIN courses
ON     students.courseId = courses.id
</code>
</codeblock>

Notice that using just `abbreviatedName`, instead of `courses.abbreviatedName` in the `SELECT` list, works fine in the above query.