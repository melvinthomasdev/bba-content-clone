We have a table `books` below. Write an SQL statement to:

1. set `price` of all the books as `500`

2. set `publisherName` of all the books as `NULL`



<codeblock language="sql" dbName="students3-v4.db" focusTableAfterRun="books" type="exercise" testMode="fixedInput">
<code>
UPDATE
</code>

<solution>
UPDATE books
SET    price = 500,
       publisherName = NULL
</solution>
</codeblock>