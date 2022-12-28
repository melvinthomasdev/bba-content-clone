Let's say we want to select a panel of 2 authors, `author1` and `author2`, out of all available authors. In that case, a query to get all combinations of names of author1 and author2, will look something like the query below.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT  a1.name AS author1,
        a2.name AS author2
FROM    authors a1 JOIN authors a2
</code>
</codeblock>

Notice that we are applying a cartesian product on the table `authors` with itself. So, this essentially is a cartesian product over a `SELF JOIN`, which works the same way as it works in a standard JOIN.

However, Note that the results are not exactly what we want. There are cases where both `author1` and `author2` are the same. This is bound to be in a SELF JOIN, because there is no check restricting the same. A filter in addition to the existing query can solve this problem.

<codeblock language="sql" dbName="students2-v3.db" type="lesson">
<code>
SELECT  a1.name AS author1,
        a2.name AS author2
FROM    authors a1 JOIN authors a2
WHERE   a1.id <> a2.id
</code>
</codeblock>

This goes on to explain that like any other JOIN, we can always add a filter/set of filters to results of a cartesian product.
