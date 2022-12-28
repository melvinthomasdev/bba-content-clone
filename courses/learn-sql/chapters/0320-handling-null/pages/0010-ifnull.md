Let's say we want to display the name and grade of all the students. However, for the students who don't have grade information, we want to display 'No Grade' instead of it left blank.

One way of doing this would be using a conditional `CASE` clause.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name,  CASE
                WHEN grade IS NOT NULL
                    THEN grade
                ELSE 'No Grade'
              END AS grade
FROM students
</code>
</codeblock>

However, when the use case is simply to implement a check of a value being NULL, there is a cleaner way. We can use an `IFNULL` function to do this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, 
       IFNULL(grade, 'No Grade') AS grade
FROM students
</code>
</codeblock>

`IFNULL` accepts 2 arguments. The first argument is the column that needs to be picked (in this case, `grade`). The second argument is the value that is supposed to be returned in case the value from the column picked turns out to be `NULL`.