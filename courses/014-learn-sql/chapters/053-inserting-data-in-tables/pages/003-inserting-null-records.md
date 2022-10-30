Let's say we want to add information about a student, for which the `age` information is not available. Look at the following query.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students VALUES (19, 'Henry', NULL, 7, 'Java', 56)
</code>
</Editor>

If we don't have information about value for a column, when inserting a new record, we can simply add a `NULL` record in its place.