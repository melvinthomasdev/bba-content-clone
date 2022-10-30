Let's say we want to reduce the amount of variation in course data for a presentation
and
we want to display only "Ruby", "Python" and "Others".
What it means is that if the course is anything other than "Ruby" or "Python"
then instead of actual course name "Others" should be displayed.

For such cases, SQL provides a conditional operators which can be used to select data based on a condition over one or multiple columns in a row.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name,  CASE
                WHEN course IN ('Python', 'Ruby')
                    THEN course
                ELSE 'Others'
              END AS course
FROM students
</code>
</Editor>

Note that the way conditional expressions in SQL are written, differs from database to database.
We are using `Sqlite3` for this course, where the conditional operator used is `CASE`.
`PostgreSQL`, a popular relational database uses the exact same operator and syntax for expressing conditions. However, `MySQL`, another very popular database uses an `IF` syntax for conditional expressions. The same query would be written in MySQL as:

```
SELECT name, IF(course IN ('Python', 'Ruby'), course, 'Others') as course
FROM students
```