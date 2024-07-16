We can set `background-color` for
the entire table using the `table`
selector. Or we could do this separately
for any of the rows using
the `th` or `td` selectors:

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
th {
  background-color: skyblue;
}
td {
  background-color: lightgray;
}
</panel>
</code>
</codeblock>