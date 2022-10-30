Let's say we want to add information about multiple students. We can add these records through multiple `INSERT INTO` statements.

But, a single `INSERT INTO` statement can also be used to insert multiple records in a table. Look at the statement below.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students VALUES 
                    (19, 'Henry', NULL, 7, 'Java', 56),
                    (20, 'Galahad', 13, 6, 'JavaScript', 64),
                    (21, 'Arthur', 10, 4, 'Scala', 23)
</code>
</Editor>

The above SQL statement inserts 3 new rows of records in the table at once. The syntax is very similar to the one where we insert a single row of record. Each new set of records are enclosed in parentheses, and the individual rows, separated by a comma.