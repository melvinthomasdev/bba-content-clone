Write an SQL statement to create a new table `books` with the following columns. Try and use the right data types on the basis of information given about the columns.

<table>
    <tr>
        <th width='50%'>Column</th>
        <th width='50%'>Description</th>
    </tr>
    <tr>
        <td width='50%'>id</td>
        <td width='50%'>a serial number id for the book, a positive whole number</td>
    </tr>
    <tr>
        <td width='50%'>name</td>
        <td width='50%'>name of the book</td>
    </tr>
    <tr>
        <td width='50%'>price</td>
        <td width='50%'>price of the book in dollars, can be a decimal or integer value</td>
    </tr>
</table>



<Editor lang="sql" dbName="students3-v1.db" focusTableAfterRun="books" type="exercise">
<code>

</code>

<solution>
CREATE TABLE books (
                        id INTEGER,
                        name TEXT,
                        price REAL
                   )
</solution>
</Editor>