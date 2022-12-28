Display the length of name of students incremented by 1 and marks of students rounded to nearest multiple of 10 less than or equal to marks. Set the headers for two columns as `incremented_length` and `rounded_marks` respectively.

Marks rounded to nearest multiple of 10 less than or equal to marks can be calculated by `marks/10`.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT length(name) + 1 AS incremented_length, marks - (marks % 10) AS rounded_marks
FROM students
</solution>
</codeblock>