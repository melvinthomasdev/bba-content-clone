Instead of setting a width for
the entire table, you can also
provide a `width` to all the
columns using the `td` selector:

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
td {
  width: 100px;
}
</panel>
</code>
</codeblock>