We have a `students` table. Let's say we decide to increase `marks` of each student who is enrolled in the `JavaScript` course, by `5` marks each.

To do that, SQL provides an `UPDATE TABLE` statement, which can be used to update data in the columns in a table.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="lesson">
<code>
UPDATE students
SET marks = marks + 5
WHERE course = 'JavaScript'
</code>
</codeblock>

Note that after running the statement, for the students who are enrolled in JavaScript (`Johnson` and `Tony`), marks are increased by 5 each.


Note that the `UPDATE` table statement can be broken down in three parts in the above example.
The first is simply `UPDATE` followed by the name of the table (in this case, `students`).
The second part actually updates the column value. It consists of the keyword `SET` followed by an expression, where the field to the left of `=` is updated with the result of expression at the other side.
The last part is the conditional expression in `WHERE` clause, which filters out the rows for which the data has to updated.

