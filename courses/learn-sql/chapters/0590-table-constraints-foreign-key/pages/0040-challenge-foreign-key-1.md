The table `courses` below consists of columns `id`, `name` and `abbreviatedName` with `id` as `PRIMARY KEY`.

Write a set of statements to:

1. create a new table `books` with the following columns, data types and constraints.

<table>
    <tr>
        <th width='33%'>column</th>
        <th width='33%'>data type</th>
        <th width='33%'>constraint</th>
    </tr>
    <tr>
        <td width='33%'>id</td>
        <td width='33%'>INTEGER</td>
        <td width='33%'>PRIMARY KEY</td>
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
</table>

2. add these record rows to the created table `books`, in the given order.

<table>
    <tr>
        <th width='33%'>id (INTEGER)</th>
        <th width='33%'>name (TEXT)</th>
        <th width='33%'>courseId (INTEGER)</th>
    </tr>
    <tr>
        <td width='33%'>1</td>
        <td width='33%'>Basics of Ruby</td>
        <td width='33%'>4</td>
    </tr>
    <tr>
        <td width='33%'>2</td>
        <td width='33%'>Basics of SQL</td>
        <td width='33%'>7</td>
    </tr>
</table>



<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="books" type="exercise" testMode="fixedInput">
<code>
CREATE TABLE

INSERT INTO
</code>

<solution>
CREATE TABLE books (
                        id INTEGER PRIMARY KEY,
                        name TEXT NOT NULL,
                        courseId INTEGER,
                        FOREIGN KEY (courseId) REFERENCES courses (id)
                   );
INSERT INTO books VALUES
                    (1, 'Basics of Ruby', 4),
                    (2, 'Basics of SQL', 7);
</solution>
</codeblock>
