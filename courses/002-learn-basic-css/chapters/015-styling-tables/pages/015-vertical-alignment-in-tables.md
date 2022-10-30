When you set a height for the
entire table or for individual rows,
the text is vertically aligned to
the middle by default. The
`vertical-align` property can be
used to change this alignment
using the values `top`,
`middle` or `bottom`:

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
th, td {
  width: 100px;
  height: 50px;
  vertical-align: top;
}
</panel>
</code>
</Editor>

The `vertical-align` property has
no effect on the `table` selector.