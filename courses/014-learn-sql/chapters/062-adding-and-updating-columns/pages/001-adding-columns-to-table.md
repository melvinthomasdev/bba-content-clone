Let's say we want to add a new text column `nickName` to the `students` table below.

SQL provides an `ALTER TABLE` statement, for making such updates to the structure of a table.

To add a column to a table, the `ALTER TABLE` statement can be used with an `ADD COLUMN` statement.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
ALTER TABLE students
ADD COLUMN  nickName TEXT
</code>
</Editor>

To add a column with constraints, we need to add the constraints along with the column description, similar to how a column constraint is specified in `CREATE TABLE` statements.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
ALTER TABLE students
ADD COLUMN  enrolmentNumber INTEGER NOT NULL DEFAULT 11111
</code>
</Editor>