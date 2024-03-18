Write a query to display `name` and `marks` of all students, who have scored the `minimum marks out of all the students enrolled in the same course` as them. For example, if Kara, Nate and Lex are the only 3 students enrolled in `Java`, and have scored 35, 64, and 28 marks respectively, only Lex should appear in the final results.

Set the headers of `name` and `marks`, to be `name` and `marks` respectively.

`Note:` Even if you find other ways of doing it, try doing it using a correlated subquery in a WHERE clause, just for the sake of your better understanding of the topic.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
WHERE
</code>

<solution>
SELECT  name,
        marks
FROM    students s
WHERE   marks = (
                    SELECT MIN(marks)
                    FROM   students
                    WHERE  students.courseId = s.courseId
                 )
</solution>
</codeblock>