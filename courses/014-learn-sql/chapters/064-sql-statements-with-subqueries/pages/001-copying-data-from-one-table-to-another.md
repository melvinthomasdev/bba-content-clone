Let's say we want to copy over all the data from the `students` table below to a new table, called `studentsCopy`.

One way of doing it is copying over all the data manually after creating a new table with same schema.

The other is using a subquery that returns a list of rows instead of the `VALUES` list of an `INSERT INTO` statement.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="studentsCopy">
<code>
CREATE TABLE studentsCopy (
                            id INTEGER NOT NULL PRIMARY KEY,
                            name TEXT NOT NULL,
                            age INTEGER,
                            grade INTEGER,
                            course TEXT,
                            marks INTEGER NOT NULL
                          );
INSERT INTO studentsCopy
SELECT * FROM students;
</code>
</Editor>

Notice that the result of `SELECT * FROM students` serves as a replacement to the standard `VALUES` list provided in an `INSERT INTO` statement.

What if we only want to copy a subset of columns over?

The concept still remains the same. An appropriate subquery can serve as the data to INSERT, as long as it matches the columns (all/few) specified in the `INSERT` statement.


<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="studentsMetadata">
<code>
CREATE TABLE studentsMetadata (
                                id INTEGER NOT NULL PRIMARY KEY,
                                name TEXT NOT NULL,
                                enrolmentHistory TEXT
                              );
INSERT INTO studentsMetadata (id, name)
SELECT id, name FROM students;
</code>
</Editor>

Notice that in the above query, we are only copying the `id` and `name` from `students` over to `studentsMetadata`, although the `studentsMetadata` is not an exact copy of `students`. The subquery `SELECT id, name FROM students;` still is a valid list of rows, to provide to the `INSERT INTO` statement for `studentsMetadata`, given we have a specific column list specified `(id, name)`.