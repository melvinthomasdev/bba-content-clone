We want to display the id and name of all the students in the same column separated by a hyphen (`-`).

In this case, we need to `concatenate` data from two columns.
We can use the `||` operator for that.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT id || ' - ' || name AS identity
FROM students
</code>
</codeblock>

We can concatenate any combination of column data, modified column data, or plain strings together.
Run the query below to get the name and marks of all students with `marks` combined with the string `' marks'`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, marks || ' marks' AS marksScored
FROM students
</code>
</codeblock>

Please note that the way concatenation in SQL is specified, differs from database to database.
We are using `Sqlite3` for this course, where the `||` is used for concatenation.
`PostgreSQL` and `MySQL` use a `CONCAT` function to achieve the same.
The query above would be written in MySQL or PostgreSQL as shown below.

```
SELECT name, CONCAT(marks, ' marks') AS marksScored
FROM students
```