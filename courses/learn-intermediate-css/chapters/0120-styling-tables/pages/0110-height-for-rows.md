Instead of setting a height
for the entire table, you can
set a `height` for the header
row and the individual rows
separately, using the `th`
and
`td` selectors:

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
  height: 55px;
}
td {
  height: 35px;
}
</panel>
</code>
</codeblock>