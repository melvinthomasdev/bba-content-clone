We can set the width of all the
columns in a table element.

A column is a vertical arrangement
of cells in the table,
and
a common header defines it. 

For example, in the code below,
we have three columns with three
headings:
`Name`, `Age` and `Gender`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<table>
  <tr>
    <th>Name</th>
    <th>Age</th>
    <th>Gender</th>
  </tr>
  <tr>
    <td>Oliver</td>
    <td>25</td>
    <td>Male</td>
  </tr>
  <tr>
    <td>Eve Smith</td>
    <td>30</td>
    <td>Female</td>
  </tr>
</table>
</panel>
<panel language="css">
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
td {
  width: 100px;
}
</panel>
</code>
</codeblock>

From the code above,
we can observe that to
set the width for all columns,
we use the `td` selector.

Once you set the width
for all the cells,
the same width will be set
for the columns too.
