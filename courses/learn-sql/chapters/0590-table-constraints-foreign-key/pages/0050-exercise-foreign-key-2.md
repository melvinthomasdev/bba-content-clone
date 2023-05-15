The table `courses` below consists of columns `id`, `name` and `abbreviatedName` with `id` as `PRIMARY KEY`. There's another table called `teachers`, which has columns `id` and `name`, with `id` being the `PRIMARY KEY`.

Write a set of statements to:

1. create a new table `students` with the following columns, data types and constraints.

<table>
    <tr>
        <th width='33%'>column</th>
        <th width='33%'>data type</th>
        <th width='33%'>constraint</th>
    </tr>
    <tr>
        <td width='33%'>id</td>
        <td width='33%'>INTEGER</td>
        <td width='33%'>NOT NULL, PRIMARY KEY</td>
    </tr>
    <tr>
        <td width='33%'>name</td>
        <td width='33%'>TEXT</td>
        <td width='33%'>NOT NULL</td>
    </tr>
    <tr>
        <td width='33%'>courseId</td>
        <td width='33%'>INTEGER</td>
        <td width='33%'>FOREIGN KEY on id in courses</td>
    </tr>
    <tr>
        <td width='33%'>teacherId</td>
        <td width='33%'>INTEGER</td>
        <td width='33%'>FOREIGN KEY on id in teachers</td>
    </tr>
</table>

2. add these record rows to the created table `students`, in the given order.

<table>
    <tr>
        <th width='25%'>id (INTEGER)</th>
        <th width='25%'>name (TEXT)</th>
        <th width='25%'>courseId (INTEGER)</th>
        <th width='25%'>teacherId (INTEGER)</th>
    </tr>
    <tr>
        <td width='25%'>1</td>
        <td width='25%'>Grant</td>
        <td width='25%'>4</td>
        <td width='25%'>1</td>
    </tr>
    <tr>
        <td width='25%'>2</td>
        <td width='25%'>Henry</td>
        <td width='25%'>7</td>
        <td width='25%'>3</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v3.db" focusTableAfterRun="students" type="exercise" testMode="fixedInput">
<code>
CREATE TABLE

INSERT INTO
</code>

<solution>
CREATE TABLE students (
                        id INTEGER NOT NULL PRIMARY KEY,
                        name TEXT NOT NULL,
                        courseId INTEGER,
                        teacherId INTEGER,
                        FOREIGN KEY (courseId) REFERENCES courses (id),
                        FOREIGN KEY (teacherId) REFERENCES teachers (id)
                      );
INSERT INTO students VALUES
                    (1, 'Grant', 4, 1),
                    (2, 'Henry', 7, 3);
</solution>
</codeblock>
