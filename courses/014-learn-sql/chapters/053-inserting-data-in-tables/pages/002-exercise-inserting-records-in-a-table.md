Write an SQL statement to insert a new row of records in the table `students`, as per the information below.

<table>
    <tr>
        <th width='16%'>id (INTEGER)</th>
        <th width='16%'>name (TEXT)</th>
        <th width='16%'>age (INTEGER)</th>
        <th width='16%'>grade (INTEGER)</th>
        <th width='16%'>course (TEXT)</th>
        <th width='16%'>marks (INTEGER)</th>
    </tr>
    <tr>
        <td width='16%'>19</td>
        <td width='16%'>Daisy</td>
        <td width='16%'>13</td>
        <td width='16%'>7</td>
        <td width='16%'>Python</td>
        <td width='16%'>76</td>
    </tr>
</table>



<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="exercise">
<code>

</code>

<solution>
INSERT INTO students VALUES (19, 'Daisy', 13, 7, 'Python', 76)
</solution>
</Editor>