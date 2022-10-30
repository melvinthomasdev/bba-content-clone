Write a query to display the name of all books which have a next volume, and the next volume is published in the same year as the book itself. Display the name of the book, name of the next volume, publishing year and name of the course original book belongs to, under the headers `bookName, nextVolumeName, publishedIn` and `course`.



<Editor lang="sql" dbName="students2-v3.db" type="exercise">
<code>
SELECT 
FROM
ON
WHERE
</code>

<solution>
SELECT  b1.name AS bookName,
        b2.name AS nextVolumeName,
        b1.publishedIn AS publishedIn,
        courses.name AS course
FROM    books b1 JOIN books b2 JOIN courses
ON      b1.nextVolumeId = b2.id AND
        b1.courseId = courses.id
WHERE   b1.publishedIn = b2.publishedIn
</solution>
</Editor>