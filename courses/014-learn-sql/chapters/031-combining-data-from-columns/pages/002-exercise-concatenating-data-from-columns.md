Write a query that displays the following data in a single column.

_name_, age _age_, is enrolled in the course _course_.

Set the header as `studentsData`.

The data should look something like this:

<table>
    <tr>
        <th>studentsData</th>
    </tr>
    <tr>
        <td>Donald, age 3, is enrolled in the course JavaScript</td>
    </tr>
    <tr>
        <td>Joe, age 5, is enrolled in the course Python</td>
    </tr>
</table>


<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
FROM
</code>

<solution>
SELECT name || ', age ' || age || ', is enrolled in the course ' || course AS studentsData
FROM students
</solution>
</Editor>