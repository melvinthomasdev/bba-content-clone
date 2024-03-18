Write an SQL statement to create a new table `teachers` with the following columns and data types.

<table>
    <tr>
        <th width='50%'>column</th>
        <th width='50%'>data type</th>
    </tr>
    <tr>
        <td width='50%'>id</td>
        <td width='50%'>INTEGER</td>
    </tr>
    <tr>
        <td width='50%'>name</td>
        <td width='50%'>TEXT</td>
    </tr>
    <tr>
        <td width='50%'>age</td>
        <td width='50%'>INTEGER</td>
    </tr>
    <tr>
        <td width='50%'>joiningDate</td>
        <td width='50%'>TEXT</td>
    </tr>
    <tr>
        <td width='50%'>gender</td>
        <td width='50%'>TEXT</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT,
                        age INTEGER,
                        joiningDate TEXT,
                        gender TEXT
                      )
</solution>
</codeblock>