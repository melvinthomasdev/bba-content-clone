Similar to other elements like
`div` and `p`, you can set `padding` for
table cells using the `th` and `td` selectors:

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
th, td {
  text-align: left;
  padding: 10px 20px 12px 15px;
}
</panel>
</code>
</codeblock>