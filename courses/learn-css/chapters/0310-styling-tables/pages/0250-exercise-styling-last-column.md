Set a `width` of `100px`
and
`text-align` as `right`
for the last column in the table:

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
  padding: 10px;
}
</panel>
</code>

<solution>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 10px;
}
th:last-child,
td:last-child {
  width: 100px;
  text-align: right;
}
</solution>
</codeblock>