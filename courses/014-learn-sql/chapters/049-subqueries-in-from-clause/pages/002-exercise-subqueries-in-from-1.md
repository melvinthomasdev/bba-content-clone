Let's say students have to read all the books that exist for the course they are enrolled in. Write a query to display student's name, name of the course and the number of books they have to read, for each student. Set the headers for the respective columns as `student`, `course` and `numberOfBooks`.

`Note:`

1. Skip the students who don't have a course, or don't have a valid course (Think `JOIN` vs `LEFT JOIN`)

2. Do not skip the students who are enrolled in courses which have no books belonging to them. Make sure `0` is shown in `numberOfBooks` for such students. (Again, think `JOIN` vs `LEFT JOIN`)



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
ON
</code>

<solution>
SELECT  students.name AS student,
        courseSummary.courseName AS course,
        courseSummary.numberOfBooks AS numberOfBooks
FROM    students JOIN (
                        SELECT   courses.id AS courseId,
                                 courses.name AS courseName,
                                 COUNT(books.id) AS numberOfBooks
                        FROM     courses LEFT JOIN books
                        ON       books.courseId = courses.id
                        GROUP BY courses.Id
                      ) AS courseSummary
ON      students.courseId = courseSummary.courseId
</solution>
</Editor>