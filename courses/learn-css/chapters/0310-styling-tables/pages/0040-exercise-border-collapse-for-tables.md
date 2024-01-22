Add a `border-bottom` of `solid` style,
`1px` width
and
`darkgray` colour
to the table.
Collapse the double borders
too:

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
  border-bottom: 1px solid darkgray;
  border-collapse: collapse;
}
</solution>
</codeblock>