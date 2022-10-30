Write a query which shows the number of students who have got marks in single digits (0-9)
and
the number of students who got marks in double digits (10-99).

Given below is what the final result should look like (not actual values).

<table>
    <tr>
        <th width='50%'>digitsInMarks</th>
        <th width='50%'>noOfStudents</th>
    </tr>
    <tr>
        <td width='50%'>1</td>
        <td width='50%'>5</td>
    </tr>
    <tr>
        <td width='50%'>2</td>
        <td width='50%'>15</td>
    </tr>
</table>



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM students
</code>

<solution>
SELECT LENGTH(marks) AS digitsInMarks, COUNT(*) AS noOfStudents
FROM students
GROUP BY LENGTH(marks)
</solution>
</Editor>