Write an SQL statement to insert 3 new rows of records in the table `students`, as per the information below. Use a single `INSERT` query to achieve the solution.

<table>
    <tr>
        <th width='33%'>id (INTEGER)</th>
        <th width='33%'>name (TEXT)</th>
        <th width='33%'>marks (INTEGER)</th>
    </tr>
    <tr>
        <td width='33%'>19</td>
        <td width='33%'>Bubbles</td>
        <td width='33%'>32</td>
    </tr>
    <tr>
        <td width='33%'>20</td>
        <td width='33%'>Buttercup</td>
        <td width='33%'>65</td>
    </tr>
    <tr>
        <td width='33%'>21</td>
        <td width='33%'>Blossom</td>
        <td width='33%'>97</td>
    </tr>
</table>

`Note:` Try using the specific columns syntax of `INSERT INTO` statement for better understanding.



<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="exercise">
<code>
INSERT INTO
</code>

<solution>
INSERT INTO students (id, name, marks) VALUES 
                                          (19, 'Bubbles', 32),
                                          (20, 'Buttercup', 65),
                                          (21, 'Blossom', 97)
</solution>
</Editor>