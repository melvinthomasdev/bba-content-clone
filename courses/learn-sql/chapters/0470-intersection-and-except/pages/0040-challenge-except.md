Write a query to display names which are codeNames for `authors`, but not names of any of the `students`. Set the header for the result column as `uniqueCodeNames`.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM

SELECT
FROM
</code>

<solution>
SELECT codeName AS uniqueCodeNames
FROM authors
EXCEPT
SELECT name
FROM students
</solution>
</codeblock>