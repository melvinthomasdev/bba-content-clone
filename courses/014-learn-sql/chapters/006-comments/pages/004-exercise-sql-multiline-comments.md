We have a query to display all students whose age is greater than 13.
There is another code that's commented out.

Update the query using comments to get all students whose marks are less than 50.
Try achieving this without deleting any actual code (except comments symbol `--`) from the editor.
Also try achieving this without using single line comments `--`.

<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT *
FROM students
WHERE age > 13

-- SELECT *
-- FROM students
-- WHERE marks < 50
</code>

<solution>
/*
SELECT *
FROM students
WHERE age > 13
*/

SELECT *
FROM students
WHERE marks < 50
</solution>
</Editor>