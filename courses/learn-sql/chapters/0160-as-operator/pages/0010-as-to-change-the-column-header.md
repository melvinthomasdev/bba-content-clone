Find the count of all names.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(name)
FROM students
</code>
</codeblock>

The column header of the result is `count(name)`.
We can use `AS` to change the column header name to something more meaningful like `count_of_names`. `AS` stands for `ALIAS`.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT COUNT(name) AS count_of_names
FROM students
</code>
</codeblock>

Now the column header name has been changed to `count_of_names`.