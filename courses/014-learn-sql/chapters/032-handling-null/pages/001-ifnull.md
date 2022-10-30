Let's say we want to display the name and grade of all the students. However, for the students who don't have grade information, we want to display 'No Grade' instead of it left blank.

One way of doing this would be using a conditional `CASE` clause.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name,  CASE
                WHEN grade IS NOT NULL
                    THEN grade
                ELSE 'No Grade'
              END AS grade
FROM students
</code>
</Editor>

However, when the use case is simply to implement a check of a value being NULL, there is a cleaner way. We can use an `IFNULL` function to do this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, 
       IFNULL(grade, 'No Grade') AS grade
FROM students
</code>
</Editor>

`IFNULL` accepts 2 arguments. The first argument is the column that needs to be picked (in this case, `grade`). The second argument is the value that is supposed to be returned in case the value from the column picked turns out to be `NULL`.