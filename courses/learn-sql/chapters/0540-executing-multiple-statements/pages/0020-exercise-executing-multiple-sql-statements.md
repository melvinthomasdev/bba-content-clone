Write a set of SQL statements together to:

1. create a new table `teachers` with the following columns and data types.

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
</table>

2. add these record rows to the created table `teachers`

<table>
    <tr>
        <th width='33%'>id (INTEGER)</th>
        <th width='33%'>name (TEXT)</th>
        <th width='33%'>age (INTEGER)</th>
    </tr>
    <tr>
        <td width='33%'>1</td>
        <td width='33%'>Heisenburg</td>
        <td width='33%'>32</td>
    </tr>
    <tr>
        <td width='33%'>2</td>
        <td width='33%'>Feynman</td>
        <td width='33%'>28</td>
    </tr>
    <tr>
        <td width='33%'>3</td>
        <td width='33%'>Rutherford</td>
        <td width='33%'>35</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT,
                        age INTEGER
                      );
INSERT INTO teachers VALUES
                        (1, 'Heisenburg', 32),
                        (2, 'Feynman', 28),
                        (3, 'Rutherford', 35);
</solution>
</codeblock>
