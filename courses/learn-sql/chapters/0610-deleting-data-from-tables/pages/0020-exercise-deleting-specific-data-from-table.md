For the table `books` below, write an SQL statement to delete all `books` which were published before 2015 and are priced over 500.



<codeblock language="sql" dbName="students3-v4.db" focusTableAfterRun="books" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
DELETE FROM books
WHERE       publishedIn < 2015 AND
            price > 500
</solution>
</codeblock>