Let's create a new table `books`, and insert a few rows of records in it.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER,
                      name TEXT,
                      price REAL
                   );
INSERT INTO books VALUES 
                      (1, 'Basics of SQL', 333.50),
                      (2, 'Java for Beginners', 280.40),
                      (3, 'Basics of SQL', 433.00);
</code>
</codeblock>

Notice that we are allowed to insert a book with exact same name (`Basics of SQL`) twice, in the above set of statements. Sometimes, this may not be something that's acceptable in a real world database scenario.

To ensure uniqueness in records under a column, SQL provides another `constraint` called `UNIQUE`. Look at the statement below

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER,
                      name TEXT UNIQUE,
                      price REAL
                   );
</code>
</codeblock>

We add `UNIQUE` next to the column name and data type, in the list of columns in `CREATE TABLE` statement. This makes sure that no record is allowed which has the exact same value in the same column as an existing record. Try the set of statements below:

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER,
                      name TEXT UNIQUE,
                      price REAL
                   );
INSERT INTO books VALUES (1, 'Basics of SQL', 333.50);
INSERT INTO books VALUES (2, 'Java for Beginners', 280.40);
INSERT INTO books VALUES (3, 'Basics of SQL', 433.00);
</code>
</codeblock>

Notice the error that shows up. It expresses that the `UNIQUE` constraint failed. Look at the table `books` in the newly created tab. You'll see that the first two `INSERT` statements are successful, hence the two records in `books`. It is the last statement, that violates the `UNIQUE` constraint on `name`, and throws an error.

