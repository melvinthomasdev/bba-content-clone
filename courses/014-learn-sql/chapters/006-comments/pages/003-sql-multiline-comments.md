Let's say we have a query to get all students whose grade is less than 8.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE grade < 8
</code>
</Editor>

Suppose we want to start work on a different query but keep this query commented out in the editor.
We can simply comment all of the lines of this query to achieve this.

<Editor lang="sql" dbName="students1.db">
<code>
-- SELECT *
-- FROM students
-- WHERE grade < 8

SELECT *
FROM students
WHERE age < 13
</code>
</Editor>

But adding comments symbol for multiple lines can be a bit tedious. To avoid that, we can use multiline comments to achieve this.

<Editor lang="sql" dbName="students1.db">
<code>
/* 
SELECT *
FROM students
WHERE grade < 8
*/

SELECT *
FROM students
WHERE age < 13
</code>
</Editor>

Note that anything enclosed between the symbols `/*` and `*/` will be considered a comment.
