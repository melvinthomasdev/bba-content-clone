By default, the text in the header
row is center aligned and the text
in all other rows is left aligned.
The `text-align` property can be
used to change this alignment using
the values `left`, `right`,
`center` or `justify`:

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
  width: 100%;
  text-align: left;
}
</panel>
</code>
</Editor>

You can align text differently for
the header row and other rows by
setting values for `th`
and
`td` separately:

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
  width: 100%;
}
th {
  text-align: left;
}
td {
  text-align: center;
}
</panel>
</code>
</Editor>