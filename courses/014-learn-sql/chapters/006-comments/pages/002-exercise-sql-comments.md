We have a query to display all students whose age is greater than 13.
Some part of the code is commented out.

Update the query using comments to get all students whose age is less than 13.
Try achieving this without deleting any actual code (except comments symbol `--`) from the editor.

<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT *
FROM students
-- WHERE age < 13
WHERE age > 13
</code>

<solution>
SELECT *
FROM students
WHERE age < 13
-- WHERE age > 13
</solution>
</Editor>