There are two tables `courses` and `teachers`, given below. Write a set of SQL statements to add these new columns to specified tables.

<table>
    <tr>
        <th width='25%'>table</th>
        <th width='25%'>new column name</th>
        <th width='25%'>data type</th>
        <th width='25%'>constraint</th>
    </tr>
    <tr>
        <td width='25%'>courses</td>
        <td width='25%'>startedIn</td>
        <td width='25%'>INTEGER</td>
        <td width='25%'>DEFAULT 2015</td>
    </tr>
    <tr>
        <td width='25%'>teachers</td>
        <td width='25%'>courseId</td>
        <td width='25%'>INTEGER</td>
        <td width='25%'>NOT NULL, DEFAULT 1</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v3.db" focusTableAfterRun="courses" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
ALTER TABLE courses
ADD COLUMN  startedIn INTEGER DEFAULT 2015;

ALTER TABLE teachers
ADD COLUMN  courseId INTEGER NOT NULL DEFAULT 1;
</solution>
</codeblock>