Let's say we want to create a new table `books`, and want the `name`s of books to be both `unique` and `not-null`.

In this case, we need to combine constraints on the `name` column.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER,
                      name TEXT UNIQUE NOT NULL,
                      price REAL
                   );
</code>
</codeblock>

To combine constraints, we just need to mention them one next to another, against the column name and data type.

Try the two different set of SQL statements to check if both constraints work.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER,
                      name TEXT UNIQUE NOT NULL,
                      price REAL
                   );
INSERT INTO books VALUES (1, NULL, 333.30);
</code>
</codeblock><codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER,
                      name TEXT UNIQUE NOT NULL,
                      price REAL
                   );
INSERT INTO books VALUES (1, 'Basics of JavaScript', 333.30);
INSERT INTO books VALUES (2, 'Basics of JavaScript', 450.50);
</code>
</codeblock>