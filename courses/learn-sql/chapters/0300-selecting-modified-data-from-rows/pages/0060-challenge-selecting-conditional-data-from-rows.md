Write a query to display student's name, marks and a third column named "result".
The value of "result" should be be "passed" if marks is greater than 33. Otherwise
value should be "failed".



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
FROM
</code>

<solution>
SELECT name, marks, CASE
                WHEN marks > 33
                    THEN 'passed'
                ELSE 'failed'
            END AS result
FROM students
</solution>
</codeblock>