Write an SQL query to list all course names in alphabetical order, and for each of them, display the number of books that belong to them, and the number of students that belong to them. 

Set the headers for course names, number of books and number of students as `course`, `numberOfBooks` and `numberOfStudents` respectively.

`Note`: Display `0` for count of students as well as count of books if there are no matching records for a course.

`HINT`: Subqueries can serve as both sides of a JOIN



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT    
FROM      (
                
          ) 
          JOIN
          (
        
          )
ON        
GROUP BY
ORDER BY
</code>

<solution>
SELECT    booksSummary.course AS course,
          booksSummary.numberOfBooks AS numberOfBooks,
          studentsSummary.numberOfStudents AS numberOfStudents
FROM      (
                SELECT   courses.id AS courseId,
                         courses.name AS course,
                         COUNT(books.id) AS numberOfBooks
                FROM     courses LEFT JOIN books
                ON       books.courseId = courses.id
                GROUP BY courses.id
          ) AS booksSummary
          JOIN
          (
                SELECT   courses.id AS courseId,
                         COUNT(students.id) AS numberOfStudents
                FROM     courses LEFT JOIN students
                ON       students.courseId = courses.id
                GROUP BY courses.id
          ) AS studentsSummary
ON        booksSummary.courseId = studentsSummary.courseId
GROUP BY  course
ORDER BY  course
</solution>
</Editor>