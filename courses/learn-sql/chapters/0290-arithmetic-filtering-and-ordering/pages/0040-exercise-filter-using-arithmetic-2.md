Display **name**, **age** and **marks** for a student
whose **marks** is an odd number.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, age, marks
FROM students
WHERE marks % 2 = 1
</solution>
</codeblock>