When we add borders around cells,
we get double borders. We can use
the property `border-collapse`
to change this behavior:

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
    <td>Eve</td>
    <td>30</td>
    <td>Female</td>
  </tr>
</table>
</panel>
<panel lang="css">
table, th, td {
  border: 1px solid darkgray;
  border-collapse: collapse;
}
</panel>
</code>
</Editor>

The default value for this property is `separate`.