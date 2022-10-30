Let's say we create a table called `books`, with `id`, `name` and `price` as columns, and insert a few records in it.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="books">
<code>
CREATE TABLE books (
                      id INTEGER NOT NULL,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350
                   );
INSERT INTO books VALUES
                      (1, 'Basics of SQL', 333.50),
                      (2, 'Java for Beginners', 280.40),
                      (3, 'Basics of SQL', 333.50);
</code>
</Editor>

Notice that there are two books with the name `Basics of SQL` with the exact same price. And it is a perfectly possible scenario. There might be some data about these two books which is different from the other, but we don't have that information. To the database, these are two separate books.

In that case, how do we identify the `uniqueness` of a book? One of the possible answers here is, their `id`. Yes, but how do we make sure that it is enforced in the structure of the table?

An answer could be using the `UNIQUE` constraint. But, there is a fine difference between what `UNIQUE` does, and the problem we are trying to solve here. A `UNIQUE` constraint simply makes sure that values in different rows, under the same column, marked unique, remain unique. There can be multiple `UNIQUE` columns in a table. But they can't identify an individual row of records in isolation with others.

SQL provides a concept called `PRIMARY KEY`, to solve the problem of individual identification of records. Have a look at the `CREATE TABLE` statement below:

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="books">
<code>
CREATE TABLE books (
                      id INTEGER PRIMARY KEY,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350
                   );
</code>
</Editor>

At its most basic level, a `PRIMARY KEY` is a column in the table that has the ability to uniquely identify a row of records. So, in its basic version, one can simply declare a column as `PRIMARY KEY` by mentioning it next to the column name and data type.