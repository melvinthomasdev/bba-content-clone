By default, the table occupies only as much width as required by the content. But we can manually set the `width` for a table too.

If the specified width is smaller than the content width, the columns will occupy the minimum width required to display the content properly. If the specified width is larger than required, the additional width is added to all the columns proportionately:

<Editor lang="css">
<code>
<panel lang="html">
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
<panel lang="css">
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table {
  width: 400px;
}
</panel>
</code>
</Editor>

Try increading the width to `500px` or reducing it to `50px` to see what happens.