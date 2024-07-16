Add a `thin`, `dashed` border of `black` colour around the table and all the cells:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<table>
  <tr>
    <th>Sport</th>
    <th>Equipment</th>
  </tr>
  <tr>
    <td>Boxing</td>
    <td>Gloves</td>
  </tr>
  <tr>
    <td>Archery</td>
    <td>Arrow</td>
  </tr>
</table>
</panel>
<panel language="css">

</panel>
</code>

<solution>
table, th, td {
  border: thin dashed black;
}
</solution>
</codeblock>