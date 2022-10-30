Write a query to display `name` of each student, and the `difference between the marks the student scored and the average marks of the students enrolled in the same course as the student`. Set the 2 respective headers as `name` and `deviation`.

For example, if `Clark` has scored `85` marks, and is enrolled in `Java`, where the average marks of students enrolled in `Java` is `55`, then under the header `deviation`, the results should show `85 - 55 = 30` for `Clark`

`Note:` Even if you find other ways of doing it, try doing it using a correlated subquery in a SELECT clause, just for the sake of your better understanding of the topic.

`Hint:` In addition to be valid as an individual field in a SELECT clause, the results from a subquery can also serve as part of a field, as either sides of an arithmetic/boolean operator, given the result from the subquery is a single value.



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
</code>

<solution>
SELECT  name,
        marks - (
                    SELECT AVG(marks)
                    FROM    students s
                    WHERE   s.courseId = students.courseId
                ) AS deviation
FROM    students
</solution>
</Editor>