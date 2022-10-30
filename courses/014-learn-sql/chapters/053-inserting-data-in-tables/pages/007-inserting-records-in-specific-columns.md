Let's say we just have information about the `id`, `name` and `grade` of a new student, and that's the only information we want to add in a new record to the table.

One way of doing this is adding `NULL` for all the columns for which data is not available.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students VALUES (19, 'Jiaying', NULL, 9, NULL, NULL)
</code>
</Editor>

However, there is a cleaner way of doing it. Look at the statement below:

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students (id, name, grade) VALUES (19, 'Jiaying', 9)
</code>
</Editor>

This extended syntax of `INSERT INTO` can be used to push data only for specific columns as a new row of records. The table name (in this case, `students`) is followed by a list of names of specific columns in parentheses. Then, we can include values for only those items in the `VALUES` list.
Needless to say, the count, order and type of values in the specific columns list should match the same for the values being inserted.

The same concept can be used for inserting multiple rows of data for specific columns as well.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students (id, name, grade) VALUES 
                                          (19, 'Jiaying', 9),
                                          (20, 'Gordon', 8),
                                          (21, 'Ramsay', 7)
</code>
</Editor>

However, please note that inserting data in specific columns is `not always` going to work. If columns others than the ones mentioned in the specific columns list have a few `CONSTRAINTS` on them, that need information on them to be present, these statements will throw errors. We will cover that in detail in the next chapters.