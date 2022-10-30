Write a query to display name, grade and marks of all students who have scored marks which lie between the lowest marks scored by a student in grade 7 and the highest marks scored by a student in grade 6. Let the headers of result columns be `name`, `grade` and `marks` respectively.

`HINT`: Subqueries can also serve as the two sides of a `BETWEEN` operator in a `WHERE` filter.



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
WHERE
</code>

<solution>
SELECT name, grade, marks
FROM   students
WHERE  marks BETWEEN (
                        SELECT MIN(marks)
                        FROM   students
                        WHERE  grade = 7
                     )
                     AND
                     (
                        SELECT MAX(marks)
                        FROM   students
                        WHERE  grade = 6
                     )
</solution>
</Editor>