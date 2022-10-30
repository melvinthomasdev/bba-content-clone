Let's create a new table `teachers`, and insert a few rows of records in it.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT,
                        age INTEGER,
                        contact TEXT
                      );
INSERT INTO teachers VALUES
                        (1, 'Heisenburg', 32, '98712341234'),
                        (2, 'Hannibal', -28, '98634214324'),
                        (3, 'Rutherford', 35, '98556431234');
</code>
</Editor>

Notice that we are able to enter a record with `age` as `-28`. That is something that's probably not possible 😊. How do we make sure that negative values are not allowed in new inserts? Or better, how do we make sure teachers are at least of age 21?

SQL provides a `CHECK` constraint to solve this. Take a look at the statement below.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT NOT NULL,
                        age INTEGER CHECK (age > 21),
                        contact TEXT
                      );
</code>
</Editor>

To specify the `CHECK` constraint for a column, just mention the keyword `CHECK` in the list of constraints for the column it is supposed to work for, followed by a boolean expression that involves the column being checked for. Take a look at the result for the set of statements below.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT NOT NULL,
                        age INTEGER CHECK (age > 21),
                        contact TEXT
                      );
INSERT INTO teachers VALUES (1, 'Heisenburg', 32, '98712341234');
INSERT INTO teachers VALUES (2, 'Hannibal', -28, '98634214324');
</code>
</Editor>

Note that on attempting an insert with `age` less than 21, we get an error that expresses failing `CHECK` constraint.

Let's try and attempt another check on the `contact` column, which is of `TEXT` data type. Let's make sure that `contact` is always of `11` characters in length. Have a look at the results/errors of the set of statements below:

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT NOT NULL,
                        age INTEGER CHECK (age > 21),
                        contact TEXT CHECK (LENGTH(contact) = 11)
                      );
INSERT INTO teachers VALUES (1, 'Heisenburg', 32, '98712341234');
INSERT INTO teachers VALUES (2, 'Hannibal', 28, '986342143');
</code>
</Editor>