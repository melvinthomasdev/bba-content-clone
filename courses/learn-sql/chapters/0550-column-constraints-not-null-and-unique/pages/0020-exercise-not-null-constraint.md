Write a set of SQL statements together to:

1. create a new table `courses` with the following columns, data types and constraints.

    <table>
        <tr>
            <th width='33%'>column</th>
            <th width='33%'>data type</th>
            <th width='33%'>constraint</th>
        </tr>
        <tr>
            <td width='33%'>id</td>
            <td width='33%'>INTEGER</td>
            <th width='33%'>NOT NULL</th>
        </tr>
        <tr>
            <td width='33%'>name</td>
            <td width='33%'>TEXT</td>
            <th width='33%'>NOT NULL</th>
        </tr>
        <tr>
            <td width='33%'>abbreviation</td>
            <td width='33%'>TEXT</td>
            <th width='33%'></th>
        </tr>
    </table>

2. add these record rows to the created table `courses`

    <table>
        <tr>
            <th width='33%'>id (INTEGER)</th>
            <th width='33%'>name (TEXT)</th>
            <th width='33%'>abbreviation (TEXT)</th>
        </tr>
        <tr>
            <td width='33%'>1</td>
            <td width='33%'>JavaScript</td>
            <td width='33%'>js</td>
        </tr>
    </table>



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="courses" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
CREATE TABLE courses (
                        id INTEGER NOT NULL,
                        name TEXT NOT NULL,
                        abbreviation TEXT
                     );
INSERT INTO courses VALUES 
                     (1, 'JavaScript', 'js');
</solution>
</codeblock>