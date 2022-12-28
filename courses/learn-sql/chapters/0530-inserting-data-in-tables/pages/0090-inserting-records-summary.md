Let's say we want to add a student with name 'Parker', age '16' and grade '10' to the students table, with all the other information as `NULL`. Let's look at all the ways we can do this, and what we can not do.

The first way is by using standard INSERT INTO syntax and passing `NULL` to the columns for which there is no data.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="lesson">
<code>
INSERT INTO students VALUES (19, 'Parker', 16, 10, NULL, NULL)
</code>
</codeblock>

Now, if we don't want to explicitly specify `NULL` in our statement, what are our options?

There might be a chance we think that because the columns that we have no data for, are the last 2 columns, we can get away without specifying them in the VALUES list. In that case we might come up with a query that looks like the one below. Go ahead and run it.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="lesson">
<code>
INSERT INTO students VALUES (19, 'Parker', 16, 10)
</code>
</codeblock>

There is an error `table students has 6 columns but 4 values were supplied`. This explains that if we use INSERT INTO syntax without a column list, we **have to** explicitly specify values for all columns in the table, as explained in the first query on this page.

The second option then, is using a column list with the INSERT INTO statement. Run the query below

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="lesson">
<code>
INSERT INTO students (id, name, age, grade) VALUES (19, 'Parker', 16, 10)
</code>
</codeblock>

So in summary, there are only 2 ways to insert a new record in a table.

1. INSERT INTO without a column list: In this case, we need to specify values for all the columns in the table in sequence in VALUES list. We can choose to put NULL in the place of data we don't have.
2. INSERT INTO with a column list: In this case, we can specify a list of columns for which we want to add data, and then specify data for only those columns in the VALUES list in order of the columns specified.
