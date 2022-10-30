By default, the table occupies only as much height as required by the content. But we can manually set the `height` for a table too.

If the specified height is smaller than the content height, the rows will occupy the minimum height required to display the content properly. On the other hand, if the specified height is larger, the additional height is added to all the rows proportionately:

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
  height: 200px;
}
</panel>
</code>
</Editor>

Try increading the height to `300px` or reducing it to `50px` to see what happens.