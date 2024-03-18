Write an SQL statement to insert a new row of records in the table `students`, as per the information below. Take care of the values that are missing in the information.

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
        <td width='16%'>20</td>
        <td width='16%'>Calvin</td>
        <td width='16%'></td>
        <td width='16%'>8</td>
        <td width='16%'></td>
        <td width='16%'>84</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
INSERT INTO students VALUES (20, 'Calvin', NULL, 8, NULL, 84)
</solution>
</codeblock>