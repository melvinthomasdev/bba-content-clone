Note the table `students`. Let's say we want to add multiple rows of records to it. Let's see if multiple `INSERT` statements can work together.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students VALUES (19, 'Henry', NULL, 7, 'Java', 56)
INSERT INTO students VALUES (20, 'Galahad', 13, 6, 'JavaScript', 64)
INSERT INTO students VALUES (21, 'Arthur', 10, 4, 'Scala', 23)
</code>
</Editor>

We get a syntax error. That's because when we execute a single statement it works fine. But when we execute multiple statements, we need a separator between each of them. In SQL, a semicolon (`;`) serves that purpose. Run the set of statements below:

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students VALUES (19, 'Henry', NULL, 7, 'Java', 56);
INSERT INTO students VALUES (20, 'Galahad', 13, 6, 'JavaScript', 64);
INSERT INTO students VALUES (21, 'Arthur', 10, 4, 'Scala', 23);
</code>
</Editor>

In `SQL`, ideally each statement/query should be followed by a semicolon. But we can do without it in a single statement/query. But it becomes important when dealing with multiple statements.
