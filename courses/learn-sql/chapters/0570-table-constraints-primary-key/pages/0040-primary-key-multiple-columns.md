Let's say we have a table `books` with `id`, `name`, `price` and an international standard book number (`isbn`) as columns, and we want each individual book to be identified uniquely by a combination of their `id` and `isbn`.

In these cases, the `PRIMARY KEY` can be specified as a combination of multiple columns. Look at the `CREATE TABLE` statement below.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER NOT NULL,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350,
                      isbn TEXT NOT NULL,
                      PRIMARY KEY (id, isbn)
                   );
</code>
</codeblock>

To specify the combination of a group of columns as the PRIMARY KEY, simply add `PRIMARY KEY` as a new item in the CREATE TABLE list, followed by the list of columns that constitute the PRIMARY KEY.

Note the results of set of statements below.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER NOT NULL,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350,
                      isbn TEXT NOT NULL,
                      PRIMARY KEY (id, isbn)
                   );
INSERT INTO books VALUES (1, 'Basics of SQL', 333.50, 'e42b-3637-119b-5a6f');
INSERT INTO books VALUES (2, 'Java for Beginners', 280.40, '2c1c-d89b-df66-c5d4');
INSERT INTO books VALUES (3, 'Basics of SQL', 333.50, 'e42b-3637-119b-5a6f');
INSERT INTO books VALUES (1, 'Basics of SQL', 333.50, 'e42b-3637-119b-5a6f');
</code>
</codeblock>

Notice that the third insert statement works, even though it has the same `isbn` as the first record, and `isbn` is a part of the primary key. But it has different `id`. Since the primary key is a combination of `id` and `isbn`, the first and third records are unique.

However, the fourth insert throws a `UNIQUE` constraint violation error. That's because it has the same combination of `id` and `isbn` as the first record, which violates the primary key constraint.
