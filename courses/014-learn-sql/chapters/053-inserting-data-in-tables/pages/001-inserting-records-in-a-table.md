Take a look at the table `students` below. It has 18 records. Let's say we want to add another record to this table, for a new student.

To insert records in a table, we use the SQL `INSERT INTO` statement. Run the SQL statement below.

<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students">
<code>
INSERT INTO students VALUES (19, 'Henry', 12, 7, 'Java', 56)
</code>
</Editor>

Notice the extra record at the end of the table, created by the statement that was run.

The statement starts with the keywords `INSERT INTO`, followed by the name of the table the records is being inserted into (in this case, `students`). This is followed by the keyword `VALUES` which simply means what set of values is to be inserted in the table as a new record.
This is followed by the actual values of the new record row, in the exact sequence and data type of columns of the table, inside parentheses.

The columns sequence in `students` is `id`(INTEGER), `name`(TEXT), `age`(INTEGER), `grade`(INTEGER), `course`(TEXT) and `marks`(INTEGER). So by the above `INSERT INTO` statement, we actually mean, we are pushing a new `students` record with `id` 19, `name` 'Henry', `age` 12, `grade` 7, `course` 'Java' and `marks` 56.