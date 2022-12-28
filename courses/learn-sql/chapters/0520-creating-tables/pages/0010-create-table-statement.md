Till now, we have been studying `queries` in SQL, which produce results from a table or group of tables. Starting now, we will study SQL `statements`. SQL statements don't necessarily query something from the database to get some data, instead, they make changes to the database itself.

Let's look one of most basic use case where we need to make a change to the database. We already have a `students` table. Now, let's say we want to introduce another table called `teachers`. Look at the statement below.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="lesson">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT,
                        age INTEGER,
                        joiningDate TEXT
                      )
</code>
</codeblock>

Notice, the newly created empty table in the form of a new tab that appears when you hit `Run Code`. Click it to find the columns listed in the `CREATE TABLE` list above.

`CREATE TABLE` is how an SQL statement to create a new table starts, followed by the name of the table that needs to be created (in this case, `teachers`). This is followed by a list of columns inside parentheses(`()`), each of which is constituted by the `name of the column`, followed by the `type of the column`. The types included in this lesson are mostly self explanatory, (`INTEGER`, `TEXT`), and on the most basic level, mean what is the nature of data that resides in that column. We will cover them in detail in the next lesson.