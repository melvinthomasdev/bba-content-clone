Let's say we want to rename the table `students` below, to `studentsData`.

SQL provides a `RENAME TO` variant to the `ALTER TABLE` statement, to solve this problem.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="studentsData" type="lesson">
<code>
ALTER TABLE students
RENAME TO   studentsData
</code>
</codeblock>