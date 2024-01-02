Center align the text of all cells in this table:

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
table {
  width: 100%;
  height: 100px;
}
</panel>
</code>

<solution>
table {
  width: 100%;
  height: 100px;
  text-align: center;
}
</solution>
</codeblock>