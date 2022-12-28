Let's say we want to rename the column `name` in the `students` table below to `studentName`, without changing the data in it.

SQL provides a `RENAME COLUMN` variant to the `ALTER TABLE` statement, which can be used to do so.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="lesson">
<code>
ALTER TABLE    students
RENAME COLUMN  name TO studentName
</code>
</codeblock>