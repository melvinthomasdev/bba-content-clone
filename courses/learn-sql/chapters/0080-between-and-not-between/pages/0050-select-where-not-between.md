Find all students
who _don't have marks between 30 and 70_.

One way of doing this would be using `WHERE` in combination with `less than` and `greater than` operators.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE marks < 30
OR marks > 70
</code>
</codeblock>

A nicer way of doing it is by using `NOT BETWEEN`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT *
FROM students
WHERE marks NOT BETWEEN 30 AND 70
</code>
</codeblock>

We can see that `NOT BETWEEN` serves the exact opposite purpose of what `BETWEEN` serves.