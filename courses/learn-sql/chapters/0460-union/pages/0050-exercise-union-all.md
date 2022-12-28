Write a query to display name of all students and codeName of all authors, under a single column. Set the header for the single result column as `name`.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM

SELECT
FROM
</code>

<solution>
SELECT name
FROM students
UNION ALL
SELECT codeName
FROM authors
</solution>
</codeblock>