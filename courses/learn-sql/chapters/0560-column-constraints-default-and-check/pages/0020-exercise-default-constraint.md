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
        <th width='33%'>UNIQUE</th>
    </tr>
    <tr>
        <td width='33%'>name</td>
        <td width='33%'>TEXT</td>
        <th width='33%'>NOT NULL</th>
    </tr>
    <tr>
        <td width='33%'>department</td>
        <td width='33%'>TEXT</td>
        <th width='33%'>DEFAULT 'Ruby'</th>
    </tr>
</table>

2. add these record rows to the created table `teachers`

<table>
    <tr>
        <th width='33%'>id (INTEGER)</th>
        <th width='33%'>name (TEXT)</th>
        <th width='33%'>department (TEXT)</th>
    </tr>
    <tr>
        <td width='33%'>1</td>
        <td width='33%'>Jofra</td>
        <td width='33%'>SQL</td>
    </tr>
    <tr>
        <td width='33%'>2</td>
        <td width='33%'>Kagiso</td>
        <td width='33%'><i>Not Specified</i></td>
    </tr>
    <tr>
        <td width='33%'>3</td>
        <td width='33%'>Marcus</td>
        <td width='33%'>NULL</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
CREATE TABLE teachers (
                      id INTEGER UNIQUE,
                      name TEXT NOT NULL,
                      department TEXT DEFAULT 'Ruby'
                   );
INSERT INTO teachers            VALUES (1, 'Jofra', 'SQL');
INSERT INTO teachers (id, name) VALUES (2, 'Kagiso');
INSERT INTO teachers            VALUES (3, 'Marcus', NULL);
</solution>
</codeblock>
