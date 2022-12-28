Write a query to display the following under a single column:

1. Names of all students enrolled in the Java course
2. Names of all the books that belong to the Java course
3. Names of all authors who have written at least one book that belongs to Java

<br />
Also, show the kind of data, by displaying `Student`, `Book` or `Author` as `type` in front of each result. The headers for type and the `student/book/author` data should be `type` and `javaData` respectively.

The result should look something like this:

<table>
    <tr>
        <th width='50%'>type</th>
        <th width='50%'>javaData</th>
    </tr>
    <tr>
        <td width='50%'>Student</td>
        <td width='50%'>Joaquin</td>
    </tr>
    <tr>
        <td width='50%'>Book</td>
        <td width='50%'>Basics of Java</td>
    </tr>
    <tr>
        <td width='50%'>Student</td>
        <td width='50%'>Heath</td>
    </tr>
    <tr>
        <td width='50%'>Author</td>
        <td width='50%'>Mat Reeves</td>
    </tr>
    <tr>
        <td width='50%'>Book</td>
        <td width='50%'>Advanced Java</td>
    </tr>
</table>

`Hint:`

If we want to select `type` as `Book`, and name of book from `books`, we can use the following query:

```
SELECT  'Book' AS type,
        name
FROM    books
```



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
ON
WHERE

SELECT
FROM
ON
WHERE

SELECT
FROM
ON
WHERE
</code>

<solution>
SELECT  'Student' AS type,
        students.name AS javaData
FROM    students JOIN courses
ON      students.courseId = courses.id
WHERE   courses.name = 'Java'

UNION

SELECT 'Book' AS type,
books.name AS javaData
FROM courses JOIN books
ON books.courseId = courses.id
WHERE courses.name = 'Java'

UNION

SELECT 'Author' AS type,
authors.name AS javaData
FROM courses JOIN books JOIN authors
ON books.courseId = courses.id AND
books.authorId = authors.id
WHERE courses.name = 'Java'
</solution>
</codeblock>