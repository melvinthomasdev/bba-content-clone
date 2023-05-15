Write a set of SQL statements together to:

1. create a new table `teachers` with the following columns, data types and constraints.

<table>
    <tr>
        <th width='33%'>column</th>
        <th width='33%'>data type</th>
        <th width='33%'>constraint</th>
    </tr>
    <tr>
        <td width='33%'>id</td>
        <td width='33%'>INTEGER</td>
        <td width='33%'>PRIMARY KEY, AUTOINCREMENT</td>
    </tr>
    <tr>
        <td width='33%'>name</td>
        <td width='33%'>TEXT</td>
        <td width='33%'>NOT NULL</td>
    </tr>
    <tr>
        <td width='33%'>department</td>
        <td width='33%'>TEXT</td>
        <td width='33%'></td>
    </tr>
</table>

2. add these record rows to the created table `teachers`, in the given order.

<table>
    <tr>
        <th width='33%'>name (TEXT)</th>
        <th width='33%'>department (TEXT)</th>
    </tr>
    <tr>
        <td width='33%'>Marcus</td>
        <td width='33%'>Ruby</td>
    </tr>
    <tr>
        <td width='33%'>Jofra</td>
        <td width='33%'>SQL</td>
    </tr>
    <tr>
        <td width='33%'>Kagiso</td>
        <td width='33%'>JavaScript</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
CREATE TABLE teachers (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        name TEXT NOT NULL,
                        department TEXT
                      );
INSERT INTO teachers (name, department) VALUES
                                        ('Marcus', 'Ruby'),
                                        ('Jofra', 'SQL'),
                                        ('Kagiso', 'JavaScript');
</solution>
</codeblock>
