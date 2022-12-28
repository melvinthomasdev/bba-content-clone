Write a set of SQL statements to:

1. Create a VIEW `booksCourses` that contains these three columns: `bookId`, `bookName`, `courseName`. The data should be the id, name and the name of the course the book belongs to for all the books. For the books that do not have a course that they belong to, `courseName` should be NULL.

2. Use the VIEW `booksCourses` in combination with `authors` and `books` to get the name of the book, name of the author it belongs to and name of the course it belongs to for all the books. For books that don't have an author or course, the relevant columns should be `NULL`. The headers should be set as `bookName`, `authorName` and `courseName` respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" checkForViews="booksCourses" testMode="fixedInput">
<code>

</code>

<solution>
CREATE VIEW booksCourses AS
SELECT books.id AS bookId,
       books.name AS bookName,
       courses.name AS courseName
FROM   books LEFT JOIN courses
ON     books.courseId = courses.id;

SELECT booksCourses.bookName,
       authors.name AS authorName,
       booksCourses.courseName

FROM   books 
       LEFT JOIN authors ON books.authorId = authors.id
       JOIN      booksCourses ON booksCourses.bookId = books.id
</solution>
</codeblock>