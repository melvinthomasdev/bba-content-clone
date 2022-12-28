Let's say we want to select the length of the names of students along with their names.

SQL has a `LENGTH` function which can be used for this.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, LENGTH(name)
FROM students
</code>
</codeblock>

`LENGTH` can also be used on number or integer columns in addition to string columns.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, age, LENGTH(age)
FROM students
</code>
</codeblock>