Note the table `courses` below. It consists of columns `id`, `name` and `abbreviatedName`, with `id` as the `PRIMARY KEY`.

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="courses" displayDbOnly="true" type="lesson">
<code>

</code>
</codeblock>

Let's say we have to create a new table `students`. The table `students` contains information about students, namely the columns `id`, `name` and `age`. Additionally we also want to store the information about what `course` each student is enrolled in. The course information already exists in the table `courses`. Have a look at how we do it, in the `CREATE TABLE` statement for `students` below:

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="students" type="lesson">
<code>
CREATE TABLE students (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL,
                        age INTEGER NOT NULL,
                        courseId INTEGER NOT NULL
                      );
INSERT INTO students VALUES
                        (1, 'Fitz', 10, 3),
                        (2, 'Simmons', 11, 5);
</code>
</codeblock>

Note that the column `courseId` in `students` is actually a reference to the `id` column in the `courses` table. What it means, is that a student in a record row is enrolled in the course with the `id` in `courses`, same as the `courseId` in the record row. For example, the student `Fitz` is enrolled in the course `Python` (`id 3`).

This specific kind of column, which is actually a `reference` to a `PRIMARY KEY` of another table, can be classified as a `FOREIGN KEY`. It uniquely identifies a record's relationship with a row in another table. To specify a column as `FOREIGN KEY`, we need to declare it as a `table constraint`. Have a look at the statement below:

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="students" type="lesson">
<code>
CREATE TABLE students (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL,
                        age INTEGER NOT NULL,
                        courseId INTEGER NOT NULL,
                        FOREIGN KEY (courseId) REFERENCES courses (id)
                      );
INSERT INTO students VALUES
                        (1, 'Fitz', 10, 3),
                        (2, 'Simmons', 11, 5);
</code>
</codeblock>

The `FOREIGN KEY` constraint on a table can be defined as a new item in the `CREATE TABLE` columns list. It starts with `FOREIGN KEY` followed by the name of the column which is to be declared as `FOREIGN KEY` in parentheses (in this case, `courseId`). This is followed by the keyword `REFERENCES` and the name of the table whose `PRIMARY KEY` is referred (in this case, `courses`), followed by the name of the `PRIMARY KEY` (in this case, `id` from `courses`)
