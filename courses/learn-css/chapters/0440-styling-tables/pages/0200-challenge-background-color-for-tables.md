Set `background-color` as `tan`
for the entire table:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
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
<panel language="css">
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</panel>
</code>

<solution>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
  background-color: tan;
}
</solution>
</codeblock>