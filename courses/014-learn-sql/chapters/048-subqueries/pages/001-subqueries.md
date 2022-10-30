Let's say we want to display names and marks of all students who have scored marks greater than the marks scored by the student `Cisco`.

To solve this problem, we first need to figure out the marks scored by `Cisco`, using the query below:

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT marks
FROM   students
WHERE  name = 'Cisco'
</code>
</Editor>

We get the answer as `65`, and then we can use it to get the names and marks of all students who scored more marks:

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT name, marks
FROM   students
WHERE  marks > 65
</code>
</Editor>

We get the right answer. But the same problem can be solved by firing a single query, using a concept called `SUBQUERY`. Have a look at the query below:

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT  name, marks
FROM    students
WHERE   marks > (
                  SELECT marks
                  FROM students
                  WHERE name = 'Cisco'
                )
</code>
</Editor>

Notice, the result of the query inside the parentheses is supposed to be equivalent to either some marks (an integer), or a NULL value, both of which can be put in a filter query for marks. So, the query itself can be used as part of the filter. Such a query is called a `subquery`.