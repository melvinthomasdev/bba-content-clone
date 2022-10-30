Vertically align the text of header
row to `top` and the text of all
other rows to the `bottom`:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<table>
  <tr>
    <th>Sport</th>
    <th>Equipment</th>
    <th>Quantity</th>
  </tr>
  <tr>
    <td>Boxing</td>
    <td>Gloves</td>
    <td>2</td>
  </tr>
  <tr>
    <td>Archery</td>
    <td>Arrow</td>
    <td>10</td>
  </tr>
</table>
</panel>
<panel lang="css">
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
  width: 100%;
  height: 160px;
}
</panel>
</code>

<solution>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
  width: 100%;
  height: 160px;
}
th {
  vertical-align: top;
}
td {
  vertical-align: bottom;
}
</solution>
</Editor>