Let's say that a student is considered _underage_ if the difference between the age and the grade is 5 or less.
For example a student who is 8 years old and is in 2nd grade would not be considered underage because 8 - 2 = 6 and 6 is more than 5.

Write a query to display the name, age, grade and whether student is underage or not under the header `isUnderage`.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, age, grade, (age - grade <= 5) AS isUnderage
FROM students
</solution>
</codeblock>