Write a set of SQL statements together to:

1. create a new table `teachers` with the following columns, data types and constraints.

<table>
    <tr>
        <th width='33%'>column</th>
        <th width='33%'>data type</th>
        <th width='33%'>constraint</th>
    </tr>
    <tr>
        <td width='33%'>teacherTypeId</td>
        <td width='33%'>INTEGER</td>
        <td width='33%'>NOT NULL</td>
    </tr>
    <tr>
        <td width='33%'>name</td>
        <td width='33%'>TEXT</td>
        <td width='33%'>NOT NULL</td>
    </tr>
    <tr>
        <td width='33%'>department</td>
        <td width='33%'>TEXT</td>
        <td width='33%'>NOT NULL</td>
    </tr>
</table>

2. set a combination of `teacherTypeId` and `department` as the `PRIMARY KEY` on `teachers`

3. add these record rows to the created table `teachers`

<table>
    <tr>
        <th width='33%'>teacherTypeId (INTEGER)</th>
        <th width='33%'>name (TEXT)</th>
        <th width='33%'>department (TEXT)</th>
    </tr>
    <tr>
        <td width='33%'>112</td>
        <td width='33%'>Jofra</td>
        <td width='33%'>SQL</td>
    </tr>
    <tr>
        <td width='33%'>113</td>
        <td width='33%'>Kagiso</td>
        <td width='33%'>Ruby</td>
    </tr>
    <tr>
        <td width='33%'>114</td>
        <td width='33%'>Marcus</td>
        <td width='33%'>SQL</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
CREATE TABLE teachers (
                        teacherTypeId INTEGER NOT NULL,
                        name TEXT NOT NULL,
                        department TEXT NOT NULL,
                        PRIMARY KEY (teacherTypeId, department)
                      );
INSERT INTO teachers VALUES (112, 'Jofra', 'SQL');
INSERT INTO teachers VALUES (113, 'Kagiso', 'Ruby');
INSERT INTO teachers VALUES (114, 'Marcus', 'SQL');
</solution>
</codeblock>
