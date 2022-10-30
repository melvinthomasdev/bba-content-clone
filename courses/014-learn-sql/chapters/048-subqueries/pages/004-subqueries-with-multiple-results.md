Let's say we want to display student names and name of the course they are enrolled in for all the students who are enrolled in a course that has more than 3 books belonging to it.

To solve this problem, we first need to figure out the course ids of courses which have more than 3 books belonging to them, using the query below:

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT    courses.id
FROM      courses JOIN books
ON        courses.id = books.courseId
GROUP BY  courses.id
HAVING    COUNT(books.id) > 3
</code>
</Editor>

Once we get the answer, which can be a list of course ids which we can use in a further query to get the desired list of students, using an `IN` filter.

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT students.name,
       courses.name
FROM   students JOIN courses
ON     students.courseId = courses.id
WHERE  courseId IN (2, 4)
</code>
</Editor>

The same problem can be solved in a single query by using a subquery, but notice that unlike the earlier examples that returned a single result from a subquery, we have a list of results. For cases like this when the result from subquery is a list, we need to use `IN` as the operator in the `WHERE` filter clause.

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT students.name,
       courses.name
FROM   students JOIN courses
ON     students.courseId = courses.id
WHERE  courseId IN (
                      SELECT    courses.id
                      FROM      courses JOIN books
                      ON        courses.id = books.courseId
                      GROUP BY  courses.id
                      HAVING    COUNT(books.id) > 3
                   )
</code>
</Editor>