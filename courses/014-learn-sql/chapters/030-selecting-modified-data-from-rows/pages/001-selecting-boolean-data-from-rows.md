Display name and age of students along with the information whether they are a teenager or not.
A student is considered a teenager if the age is between 13 and 19.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT name, age, (age BETWEEN 13 AND 19) AS isTeenager
FROM students
</code>
</Editor>

Run the code and under the column header `isTeenager` we can see 0 or 1.
1 means true and 0 means false.