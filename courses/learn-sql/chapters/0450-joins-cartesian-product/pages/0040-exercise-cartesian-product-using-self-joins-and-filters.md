Let's say we want to select a panel of 2 authors, `author1` and `author2`, out of all available authors. There's one condition though, author1 must be a female (gender 'F') and author2 must be a male (gender 'M'). Write a query to get all combinations of names of author1 and author2.

Set the headers for names of author1 and author2, as `author1` and `author2`, respectively.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
WHERE
</code>

<solution>
SELECT  a1.name AS author1,
        a2.name AS author2
FROM    authors a1 JOIN authors a2
WHERE   a1.id <> a2.id AND
        a1.gender = 'F' AND
        a2.gender = 'M'
</solution>
</codeblock>