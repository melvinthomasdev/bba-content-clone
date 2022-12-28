When creating a new table, we need to specify the `data type` for each column we want there to exist in the table. A `data type` is simply a specification of what kind of data is stored in that column. Take a look at the `CREATE TABLE` statement below.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="teachers" type="lesson">
<code>
CREATE TABLE teachers (
                        id INTEGER,
                        name TEXT,
                        age INTEGER,
                        joiningDate TEXT,
                        resume BLOB,
                        graduationPercentage REAL
                      )
</code>
</codeblock>

In the statement, `id` and `age` store integer data, `name` and `joiningDate` store text data, `resume` stores a file, and `graduationPercentage` stores decimal values. The data types against them show similar values.

Here are a few valid data types in `SQLITE`, the database this course runs on.

<table>
    <tr>
        <td width='50%'>INTEGER</td>
        <td width='50%'>Stores values that are integer in nature</td>
    </tr>
    <tr>
        <td width='50%'>REAL</td>
        <td width='50%'>Stores floating point numbers/decimal numbers</td>
    </tr>
    <tr>
        <td width='50%'>TEXT</td>
        <td width='50%'>Stores character data</td>
    </tr>
    <tr>
        <td width='50%'>BLOB</td>
        <td width='50%'>Stores binary large objects, like files</td>
    </tr>
    <tr>
        <td width='50%'>NULL</td>
        <td width='50%'>When the data type is not clear</td>
    </tr>
</table>

Other databases like `MySQL` and `PostgreSQL` have many similar to this and many other data types, sometimes many specializations of a single kind like `INTEGER` and `TEXT`. For example, `MySQL` supports `INT`, `TINYINT`, `SMALLINT`, `MEDIUMINT` and `BIGINT` as different variations for `INTEGER`, and `VARCHAR`, `TEXT` for various kinds of texts.
