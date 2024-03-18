Display the name and marks in the ascending order of the unit digit of marks.
A unit digit of marks can be calculated using `%` with 10.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, marks
FROM students
ORDER BY marks % 10
</solution>
</codeblock>