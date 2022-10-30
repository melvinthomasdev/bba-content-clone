Let's say we define `status` for every student who gets marks over 33 as `Passed` and others as `Failed`.
Write a query to show count of students for all unique combinations of `grade` and `status`, where `grade is present`

The headers for `grade`, `status` and `count of students` should be `grade`, `status` and `count` respectively.

The result should look something like this.

<table>
    <tr>
        <th width='33%'>grade</th>
        <th width='33%'>status</th>
        <th width='33%'>count</th>
    </tr>
    <tr>
        <td width='33%'>1</td>
        <td width='33%'>Passed</td>
        <td width='33%'>2</td>
    </tr>
    <tr>
        <td width='33%'>1</td>
        <td width='33%'>Failed</td>
        <td width='33%'>1</td>
    </tr>
    <tr>
        <td width='33%'>2</td>
        <td width='33%'>Passed</td>
        <td width='33%'>3</td>
    </tr>
</table>

**Note:**

1. You can use `CASE..WHEN..THEN..ELSE..END` syntax to get conditional data from a row and wrap its result with an alias.

2. An alias can also be used in a `GROUP BY` clause.



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM students
WHERE
GROUP BY
</code>

<solution>
SELECT  grade,
        (CASE
            WHEN marks > 33
                THEN 'Passed'
            ELSE 'Failed'
        END) AS status,
        COUNT(*) AS count
FROM students
WHERE grade IS NOT NULL
GROUP BY grade, status
</solution>
</Editor>