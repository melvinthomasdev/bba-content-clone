Let's say we want to select the length of the names of students along with their names.

SQL has a `LENGTH` function which can be used for this.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, LENGTH(name)
FROM students
</code>
</Editor>

`LENGTH` can also be used on number or integer columns in addition to string columns.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, age, LENGTH(age)
FROM students
</code>
</Editor>