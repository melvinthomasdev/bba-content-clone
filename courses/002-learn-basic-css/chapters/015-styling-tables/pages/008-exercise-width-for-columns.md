Set a width of `10em`
for each column of
this table:

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
  border-bottom: 1px solid black;
  border-collapse: collapse;
}
</panel>
</code>

<solution>
table, th, td {
  border-bottom: 1px solid black;
  border-collapse: collapse;
}
td {
  width: 10em;
}
</solution>
</Editor>