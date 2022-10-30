Set the text `color` as `indigo`
for `odd` columns in the table,
except for the header row columns:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<table>
  <tr>
    <th>Fruit</th>
    <th>Availability</th>
    <th>Fruit</th>
    <th>Availability</th>
  </tr>
  <tr>
    <td>Banana</td>
    <td>Available</td>
    <td>Orange</td>
    <td>Available</td>
  </tr>
  <tr>
    <td>Apple</td>
    <td>Out of stock</td>
    <td>Mango</td>
    <td>Available</td>
  </tr>
</table>
</panel>
<panel lang="css">
table, th, td {
  border: solid 1px darkgray;
  border-collapse: collapse;
  padding: 10px;
}
</panel>
</code>

<solution>
table, th, td {
  border: solid 1px darkgray;
  border-collapse: collapse;
  padding: 10px;
}
td:nth-child(odd) {
  color: indigo;
}
</solution>
</Editor>