Let's say the task is to display the name and publisherName of all books which have an author and a course they belong to, with the name of the course, and the name of their author.

In this case, we will need to `JOIN` the table `books` with `courses` and `authors` in the same query. The query would look something like this

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT  books.name AS book,
        publisherName,
        courses.name AS course,
        authors.name AS author
FROM    books JOIN courses JOIN authors
ON      books.courseId = courses.id AND
        books.authorId = authors.id
</code>
</Editor>

Note that the only differences in this query from a standard `JOIN` query are:

1. An extra table name in the `FROM` list, separated by `JOIN`

2. An additional condition in the `ON` clause, joined by `AND`

This simply means that we include all the tables that we need to pick up data from in the `FROM` list, and then mention all the relationships between columns that need to matched across the tables for the JOIN to work correctly, in the `ON` clause.
