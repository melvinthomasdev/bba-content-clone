Note the two tables `students` and `courses` below. The `courseId` in `students` is a reference to `id` in the `courses` table, to hold the information related to the course the student is enrolled in.

Let's say we want to add a column `courseName` to the `students` table. This column should store the actual name of the `course`, the `courseId` is referencing to.

To do so, we need to `UPDATE` each row of record with a specific data relevant to that row (course information). This can only be achieved by a subquery that gets the `name` of the course for `courseId` in each row. Note the subquery in the `SET` clause in `UPDATE` statement below.

<codeblock language="sql" dbName="students3-v5.db" focusTableAfterRun="students" type="lesson">
<code>
ALTER TABLE students
ADD COLUMN  courseName TEXT;

UPDATE students
SET    courseName = (
                      SELECT name
                      FROM   courses
                      WHERE  id = students.courseId
                      LIMIT  1
                    );
</code>
</codeblock>

Notice two things about the above `UPDATE` statement.

1. The value to be set in UPDATE clause for a column should be a single value (not a list), hence the `LIMIT` 1 in the subquery
2. The subquery is a correlated subquery, as it utilizes the `courseId` column from `students` table in the parent statement
