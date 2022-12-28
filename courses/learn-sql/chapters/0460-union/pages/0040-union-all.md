Let's say, we want to print id cards for all the **students** and all the **books**. An id card for a student will just have the student's id, and an id card for a book will just contain the book's id. For this, we have to print all the ids in a single result, under a single column.

This looks like a perfect use case for the `UNION` query. Go ahead and run the query given below:

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT id
FROM students
UNION
SELECT id
FROM books
</code>
</codeblock>

Notice that we have 34 records in the results. But we expected 25 student ids and 34 book ids to be shown in the list. The ids for students range from 1 to 25, and for books, range from 1 to 34. The results of the above query are just 1 to 34. This helps explain that if there are matching records from multiple queries in a `UNION`, only one of them will be included in the final results. That's another way of saying that the results of a `UNION` are always **unique**.

Then how do we solve our problem? We need all 25 student ids and all 34 book ids. In such cases, there is an extension to `UNION`, called `UNION ALL`. Run the query below:

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT id
FROM students
UNION ALL
SELECT id
FROM books
</code>
</codeblock>

Notice that by using `UNION ALL`, we get 25 + 34 = 59 results, as expected.
