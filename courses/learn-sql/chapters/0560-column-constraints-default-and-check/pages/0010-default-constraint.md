Let's say we want to create a new table `books`. Each book has an `id`, a `name` and a `price`.

For some of the books for which we want to enter records, we have all three: `id`, `name` and `price`. For the rest, we don't have the `price` information. But we want to make sure that there is a `default price` already specified, say `350`, so that if we don't specify a price for a `books` record, it is set up as `350` automatically.

To serve this purpose, SQL provides a `DEFAULT` constraint, which does the exact same thing as described above. Have a look at the `CREATE TABLE` statement below

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER NOT NULL,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350
                   );
</code>
</codeblock>

To specify the default value for a column, just mention the keyword `DEFAULT` in the list of constraints for the column it is supposed to work for, followed by the default value that is expected to exist.

Note the results of 3 different `INSERT INTO` statements, in the results of the set of statements below:

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="lesson">
<code>
CREATE TABLE books (
                      id INTEGER NOT NULL,
                      name TEXT NOT NULL,
                      price REAL DEFAULT 350
                   );
INSERT INTO books (id, name) VALUES (1, 'Basics of Java');
INSERT INTO books            VALUES (2, 'Basics of Ruby', 330);
INSERT INTO books            VALUES (3, 'Basics of Python', NULL);
</code>
</codeblock>

The first `INSERT INTO` statement does not have the `price` information. So the `DEFAULT` constraint set up in `CREATE TABLE` kicks in and the `price` is set for the book with `id` 1, as 350.

The second `INSERT INTO` statement has a `price` information, so like any other standard INSERT, the `price` information for book with `id` 2 is set as specified, 330.

The third `INSERT INTO` statement has NULL specified as the `price`. The result for the same is `NULL` in the book with `id` 3. Note that `DEFAULT` value comes into play only if the value for the column is `not specified`. In all other cases, the value specified will be set, be it `NULL` or `NOT NULL`.
