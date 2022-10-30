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
            <th width='33%'>UNIQUE</th>
        </tr>
        <tr>
            <td width='33%'>age</td>
            <td width='33%'>INTEGER</td>
            <th width='33%'></th>
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
            <td width='33%'>Phil</td>
            <td width='33%'>29</td>
        </tr>
    </table>



<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="exercise">
<code>

</code>

<solution>
CREATE TABLE teachers (
                        id INTEGER UNIQUE,
                        name TEXT UNIQUE,
                        age INTEGER
                      );
INSERT INTO teachers VALUES 
                        (1, 'Phil', 29);
</solution>
</Editor>