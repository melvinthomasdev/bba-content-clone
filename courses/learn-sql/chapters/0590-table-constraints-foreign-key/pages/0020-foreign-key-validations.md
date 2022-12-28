Let's check what exactly does FOREIGN KEY prevents. Go ahead and run the set of statements below:

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="students" type="lesson">
<code>
CREATE TABLE students (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL,
                        age INTEGER NOT NULL,
                        courseId INTEGER NOT NULL,
                        FOREIGN KEY (courseId) REFERENCES courses (id)
                      );
INSERT INTO students VALUES 
                        (1, 'Fitz', 10, 20);
</code>
</codeblock>

We get an error on the lines of `FOREIGN KEY constraint failed`.
Notice that in the INSERT statement in the above query, we tried to push a record with `courseId` 20.
However, there is no course with id 20 in the table `courses`.
This is what the FOREIGN KEY property validates.
We cannot push a record with a foreign key value that does not actually exist as the relevant primary key, as specified in table definition.
So, the insert statement does not pass.

However, in the above table definition, courseId is set as `NOT NULL`. Let's consider the same case where courseId is allowed to be `NULL`. Run the set of statements below:

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="students" type="lesson">
<code>
CREATE TABLE students (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL,
                        age INTEGER NOT NULL,
                        courseId INTEGER,
                        FOREIGN KEY (courseId) REFERENCES courses (id)
                      );
INSERT INTO students VALUES 
                        (1, 'Fitz', 10, NULL);
</code>
</codeblock>

The INSERT passes and allows us to push a record with courseId NULL.
This means the value in a FOREIGN KEY column can still be NULL, given there is no constraint that enforces it.
However, we still cannot push a record with a non-NULL FOREIGN KEY value, which is invalid, i.e. the corresponding PRIMARY KEY value does not exist.
Let's run the set of statements below and confirm that we get an error.

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="students" type="lesson">
<code>
CREATE TABLE students (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL,
                        age INTEGER NOT NULL,
                        courseId INTEGER,
                        FOREIGN KEY (courseId) REFERENCES courses (id)
                      );
INSERT INTO students VALUES 
                        (1, 'Fitz', 10, 30);
</code>
</codeblock>