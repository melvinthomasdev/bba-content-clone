Find all students who

* _are of age 15_ or _of age 13_ or _of age 12_
* and
* _belong to a grade lesser than 9_.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT *
FROM students
WHERE (age = 15 OR age = 13 OR age = 12)
AND (grade < 9)
</solution>
</Editor>