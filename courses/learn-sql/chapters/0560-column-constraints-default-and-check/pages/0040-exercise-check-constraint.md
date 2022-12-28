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
            <th width='33%'>UNIQUE, NOT NULL</th>
        </tr>
        <tr>
            <td width='33%'>name</td>
            <td width='33%'>TEXT</td>
            <th width='33%'>UNIQUE, NOT NULL</th>
        </tr>
        <tr>
            <td width='33%'>abbreviation</td>
            <td width='33%'>TEXT</td>
            <th width='33%'><i>Length should not be more than 3 characters</i></th>
        </tr>
        <tr>
            <td width='33%'>type</td>
            <td width='33%'>TEXT</td>
            <th width='33%'><i>Should be either 'Language' or 'Framework'</i></th>
        </tr>
    </table>

2. add these record rows to the created table `courses`

    <table>
        <tr>
            <th width='25%'>id (INTEGER)</th>
            <th width='25%'>name (TEXT)</th>
            <th width='25%'>abbreviation (TEXT)</th>
            <th width='25%'>type (TEXT)</th>
        </tr>
        <tr>
            <td width='25%'>1</td>
            <td width='25%'>Ruby</td>
            <td width='25%'>rb</td>
            <td width='25%'>Language</td>
        </tr>
        <tr>
            <td width='25%'>2</td>
            <td width='25%'>Rails</td>
            <td width='25%'>rls</td>
            <td width='25%'>Framework</td>
        </tr>
    </table>

`Hint:`

1. To ensure a column `name` should have values which are of length less than a value `n`, simply include the expression `LENGTH(name) < n` in the CHECK constraint.

2. To ensure a column `name` contains values which are either `a`, `b` or `c`, simply include the expression `name IN ('a', 'b', 'c')` in the CHECK constraint.



<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="courses" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
CREATE TABLE courses (
                        id INTEGER NOT NULL UNIQUE,
                        name TEXT NOT NULL UNIQUE,
                        abbreviation TEXT CHECK (LENGTH(abbreviation) <= 3),
                        type TEXT CHECK (type IN ('Language', 'Framework'))
                     );
INSERT INTO courses VALUES 
                     (1, 'Ruby', 'rb', 'Language'),
                     (2, 'Rails', 'rls', 'Framework');
</solution>
</codeblock>