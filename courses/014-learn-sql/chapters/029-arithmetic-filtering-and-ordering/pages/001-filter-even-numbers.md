Arithmetic operations like addition, subtraction, multiplication, division and modulus can be applied on an individual column.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT age + 10, length ( course ) - 1
FROM students
</code>
</Editor>

Here is another example:

<Editor lang="sql" dbName="students1.db">
<code>
SELECT age / 2, age * 2
FROM students
</code>
</Editor>