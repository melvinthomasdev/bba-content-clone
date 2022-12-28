Let's say we have a new table called `courses` with `PRIMARY KEY` `id`, and other two columns `name` and `abbreviation`.
In most real world scenarios, the primary key column is nothing but positive integers in increasing order for each new row, starting from `1`. For example, the first row has `id` 1, the next `2`, and so on.

So, instead of adding the primary key value manually for each row, this seems like something the database should itself take care of, if needed.

SQL provides an attribute called `AUTOINCREMENT` as an addition to the `PRIMARY KEY` constraint on a column, which automatically generates the appropriate PRIMARY KEY values. Note the `CREATE TABLE` statement below

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="courses" type="lesson">
<code>
CREATE TABLE courses (
                        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,
                        abbreviation TEXT NOT NULL
                     );
</code>
</codeblock>

To set up the primary key column to be incremented automatically, simply add `AUTOINCREMENT` next to the `PRIMARY KEY` declaration in the `CREATE TABLE` statement.

Note the set of statements below to see `AUTOINCREMENT` in action.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="courses" type="lesson">
<code>
CREATE TABLE courses (
                        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,
                        abbreviation TEXT NOT NULL
                     );
INSERT INTO courses (name, abbreviation) VALUES
                                        ('Ruby', 'rb'),
                                        ('SQL', 'sql'),
                                        ('Python', 'py');
INSERT INTO courses (name, abbreviation) VALUES ('JavaScript', 'js');
</code>
</codeblock>

Notice that we haven't mentioned the value of `id` column in any of the insert statements. But, in the results, that column is automatically filled, autoincremented with `id`s starting with 1. This is because `id`, the PRIMARY KEY column, is marked as `AUTOINCREMENT`.
