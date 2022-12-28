Display name and age of a student
whose age is an even number.


<codeblock type="exercise" language="sql" dbName="students1.db" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, age
FROM students
WHERE age % 2 = 0
</solution>
</codeblock>