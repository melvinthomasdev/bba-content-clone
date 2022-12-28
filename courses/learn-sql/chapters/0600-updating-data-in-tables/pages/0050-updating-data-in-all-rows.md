We have a `students` table below. Let's say we want to update `marks` of all the students to `90`.

We can use the `UPDATE` table statement to do this, without any filter.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="lesson">
<code>
UPDATE students
SET marks = 90
</code>
</codeblock>

Note that if we skip the `WHERE` clause for an `UPDATE` statement, the update is applied over all the rows in the table.
