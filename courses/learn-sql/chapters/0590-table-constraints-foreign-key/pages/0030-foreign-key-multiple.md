Note that there can be multiple `FOREIGN KEYS` on a table, with references to primary keys of multiple tables. Look at the following example, that creates another table `grades` before creating `students`, and then adds `FOREIGN KEYS` for both `grades` and `courses` on `students` table.

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="students" type="lesson">
<code>
CREATE TABLE grades   (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL
                      );
INSERT INTO grades VALUES 
                      (1, '10'),
                      (2, '11');
CREATE TABLE students (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL,
                        age INTEGER NOT NULL,
                        courseId INTEGER NOT NULL,
                        gradeId INTEGER NOT NULL,
                        FOREIGN KEY (courseId) REFERENCES courses (id),
                        FOREIGN KEY (gradeId) REFERENCES grades (id)
                      );
INSERT INTO students VALUES 
                        (1, 'Fitz', 10, 3, 1),
                        (2, 'Simmons', 11, 5, 2);
</code>
</codeblock>