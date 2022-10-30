We have a `students` table below. Let's say we want to delete the record rows for all the students who have `marks` between `30` and `70`.

SQL provides a `DELETE FROM` statement, which can be used to make the above change.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
DELETE FROM students
WHERE       marks BETWEEN 30 AND 70
</code>
</Editor>

The `DELETE FROM` statement can be broken down in two parts.
The first part is `DELETE FROM` followed by the name of the table records are to be deleted from.
The second part is simply a filter, a `WHERE` clause with one or more conditions to fulfil for the records to be deleted.
