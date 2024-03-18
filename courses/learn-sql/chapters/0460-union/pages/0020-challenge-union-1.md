Write a query to display all the book names and all the course names, under a single column. Set the header for the single result column as `academicData`.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM

SELECT
FROM
</code>

<solution>
SELECT name AS academicData
FROM books
UNION
SELECT name AS academicData
FROM courses
</solution>
</codeblock>