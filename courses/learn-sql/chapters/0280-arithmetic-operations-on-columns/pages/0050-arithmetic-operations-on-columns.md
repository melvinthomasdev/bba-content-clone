Arithmetic operations like addition, subtraction, multiplication, division and modulo can be applied on an individual column.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT age + 10, length ( course ) - 1
FROM students
</code>
</codeblock>

Here is another example.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT age / 2, age * 2
FROM students
</code>
</codeblock>