In the table, set a `background-color`
of `#ffcccb` for the row with **Apple** in it:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<table>
  <tr>
    <th>Fruit</th>
    <th>Availability</th>
  </tr>
  <tr>
    <td>Banana</td>
    <td>Available</td>
  </tr>
  <tr>
    <td>Orange</td>
    <td>Available</td>
  </tr>
  <tr>
    <td>Apple</td>
    <td>Out of stock</td>
  </tr>
  <tr>
    <td>Mango</td>
    <td>Available</td>
  </tr>
</table>
</panel>
<panel language="css">
table, th, td {
  border-collapse: collapse;
  padding: 10px;
}
</panel>
</code>

<solution>
table, th, td {
  border-collapse: collapse;
  padding: 10px;
}
tr:nth-child(4) {
  background-color: #ffcccb;
}
</solution>
</codeblock>