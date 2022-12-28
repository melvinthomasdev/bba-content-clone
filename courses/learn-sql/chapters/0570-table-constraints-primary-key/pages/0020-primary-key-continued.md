Let's insert a few records in the newly created table `books` with `PRIMARY KEY` `id`.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER PRIMARY KEY,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350
                   );
INSERT INTO books VALUES (1, 'Basics of SQL', 333.50);
INSERT INTO books VALUES (2, 'Java for Beginners', 280.40);
INSERT INTO books VALUES (1, 'Basics of SQL', 333.50);
</code>
</codeblock>

Notice that while the first two inserts happen successfully, the third insert fails with `UNIQUE` constraint violated error. That's because, we are trying to insert a record which has a non-unique value in the column marked `PRIMARY KEY` (inserting `1` as `id`, after it has already been recorded). This also explains the fact that internally, the `PRIMARY KEY` constraint on a column employs the `UNIQUE` constraint too among other things, and we need not specify `UNIQUE` in case we have already declared a column as `PRIMARY KEY`.

Go ahead, change the id of the third row to be inserted as anything other than 1 or 2, in the statement above, and Note the result.

Another key thing to notice about `PRIMARY KEY` constraint is, it can only be declared on one column in a table, unlike other constraints that can be declared on any number of columns. Note the results of the `CREATE TABLE` statement below that declares multiple columns as `PRIMARY KEY`.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER PRIMARY KEY,
                      isbn INTEGER PRIMARY KEY,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350
                   );
</code>
</codeblock>

This also explains the fact why `PRIMARY KEY` is a `table constraint` and not a `column constraint`. There can only be one `PRIMARY KEY` marked for a table, and that acts as a property/constraint of the table, and not the column itself.