Let's say we want to get the count of students in each unique combination of a grade and a course.
For example, we want to count number of students enrolled in Java in grade 1, Java in grade 2, JavaScript in grade 2, JavaScript in grade 3, and so on for all possible unique combinations of course and grade, with at least one student in it.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT course, grade, COUNT(*) AS count
FROM students
WHERE course IS NOT NULL AND grade IS NOT NULL
GROUP BY course, grade
</code>
</Editor>


When there are multiple columns in a `GROUP BY` clause, each unique combination of values in all those columns creates a separate group, over which the aggregate function is applied.

In the above data and the query that follows it, `course Java` and `grade 1` is a unique group, which has 2 students (`Harding` and `Tonya`) under it. Similarly, `course JavaScript` and `grade 6` is another unique group with just 1 student (`Johnson`) under it. `course JavaScript` also combines with `grade 9` to create another unique group, with 1 student (`Tony`) under it.