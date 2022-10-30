Let's say we have a new table called `books`. There are various columns in `books` like `name`, `price`, `publishedIn`, etc.
There is also a column called `courseId`, which is a reference to the `id` in existing `courses` table. What it means is, each book belongs to a `course` that exists in `courses` table, referenced by the `courseId`.


Write a query to display the name and price of books which belong to a course (have a not-null courseId), along with the name of the course they belong to.

The headers for the name of books, price of books, and name of course should be `bookName`, `price` and `courseName` respectively.



<Editor lang="sql" dbName="students2-v2.db" type="exercise">
<code>
SELECT
FROM
ON
</code>

<solution>
SELECT books.name AS bookName,
       price,
       courses.name AS courseName
FROM   books JOIN courses
ON     books.courseId = courses.id
</solution>
</Editor>