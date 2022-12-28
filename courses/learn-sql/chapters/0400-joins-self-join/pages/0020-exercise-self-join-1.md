The table `books` contains a column `nextVolumeId`. It stores the `id` of another book which is the next volume of the book in that row.

Write a query to display the name of all the books which have a next volume, along with the name of the book which is the next volume for each of them.

The headers for the name of books, and the name of the book which is the next volume, should be `book` and `nextVolume` respectively.




<codeblock language="sql" dbName="students2-v3.db" type="exercise" testMode="fixedInput">
<code>
SELECT 
FROM
ON
</code>

<solution>
SELECT b1.name AS book,
       b2.name AS nextVolume
FROM   books b1 JOIN books b2
ON     b1.nextVolumeId = b2.id
</solution>
</codeblock>