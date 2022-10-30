Let's create a new table `teachers`, and insert a few rows of records in it.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT,
                        age INTEGER
                      );
INSERT INTO teachers VALUES
                        (1, 'Heisenburg', 32),
                        (2, NULL, 28),
                        (3, 'Rutherford', 35);
</code>
</Editor>

Notice that we are able to enter a record with `name` as `NULL` in the table. What if, we want to enforce that no new record should contain `name` as `NULL`?

SQL provides `NOT NULL` option to add to a column definition while creating a table. It is one of the first `column constraints` that we are going to explore in this course. Look at the `CREATE TABLE` statement below.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT NOT NULL,
                        age INTEGER
                      );
</code>
</Editor>

We just have to add `NOT NULL` next to the column name and data type, in the list of columns in `CREATE TABLE` statement. This makes sure that no insert is allowed with `NULL` in the specified column. Try the set of statements below:

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT NOT NULL,
                        age INTEGER
                      );
INSERT INTO teachers VALUES
                        (1, NULL, 32);
</code>
</Editor>

Note that on attempting an insert with `name` as `NULL`, we get an error that expresses failing constraint.
