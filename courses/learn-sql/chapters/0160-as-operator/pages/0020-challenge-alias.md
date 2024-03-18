We can get the count of all grades like this.

```
SELECT COUNT(grade)
FROM students
```

Write a SQL query so that the query result appears under column header `all_grades`.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT  
FROM
</code>

<solution>
SELECT COUNT(grade) as all_grades
FROM students
</solution>
</codeblock>