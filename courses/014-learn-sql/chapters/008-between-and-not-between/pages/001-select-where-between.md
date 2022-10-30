Find all students
who _are of age between 12 and 15_.

One way of doing this would be using `OR`.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE age = 12
OR age = 13
OR age = 14
OR age = 15
</code>
</Editor>

There is a nicer way of doing it using `BETWEEN`.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT *
FROM students
WHERE age BETWEEN 12 and 15
</code>
</Editor>