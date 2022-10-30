We can get the count of all grades like this.

```
SELECT COUNT(grade)
FROM students
```

Write a SQL query so that the query result appears under column header `all_grades`.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT  
FROM
</code>

<solution>
SELECT COUNT(grade) as all_grades
FROM students
</solution>
</Editor>