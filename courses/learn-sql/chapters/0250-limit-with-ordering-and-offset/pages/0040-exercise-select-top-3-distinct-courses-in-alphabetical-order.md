Find the top 3 distinct courses students are enrolled in, in the alphabetical order of course names.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT distinct(course)
FROM students
WHERE course IS NOT NULL
ORDER BY course
LIMIT 3
</solution>
</codeblock>