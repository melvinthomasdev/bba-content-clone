Let's say we want to display the name of each student who is enrolled in a
course and the names of the courses they are enrolled in.

Since the name of the student, and the name of the course exist in two different
tables (`students` and `courses` respectively), we need to use `JOIN` to combine
the two tables.

The query will look like this.

<codeblock language="sql" dbName="students2-v1.db" type="lesson">
  <code>
    SELECT students.name, courses.name FROM students JOIN courses ON
    students.courseId = courses.id
  </code>
</codeblock>

Let's look at how the `JOIN` query was built.

The `SELECT` specifies the list of columns we need, just like list of columns we
mention in normal `SELECT` queries. However this time, specifying the table from
which each column is picked. If we just say column `name` then the database will
be confused and will show an error because column `name` is present in both the
`students` table and in the `courses` table.

The `FROM` consists of the list of tables the columns are being picked from,
separated by the word `JOIN`. In this case we are joining `students` and
`courses` table.

The `ON` is the key part of a `JOIN` query. It is used to express the columns
from each table which should be matched together to connect the data amongst
them. In this case, the column `courseId` in `students` stores the reference to
the courses students are enrolled in, in the form of `id` from the actual `id`
column from the `courses` table. Hence, the clause,
`ON students.courseId = courses.id`
