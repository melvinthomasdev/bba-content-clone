Find all students
who _are of age between 12 and 15_.

One way of doing this would be using `OR`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE age = 12
OR age = 13
OR age = 14
OR age = 15
</code>
</codeblock>

There is a nicer way of doing it using `BETWEEN`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE age BETWEEN 12 and 15
</code>
</codeblock>