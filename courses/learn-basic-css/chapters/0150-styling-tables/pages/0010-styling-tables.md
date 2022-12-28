Without styling, HTML tables look plain.
Let's look at some of the commonly used
properties to enhance their look
and
readability:

**Borders**

The `border` property for
the `table` element adds
a border around the table:

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
    <td>Eve</td>
    <td>30</td>
    <td>Female</td>
  </tr>
</table>
</panel>
<panel language="css">
table {
  border: 1px solid darkgray;
}
</panel>
</code>
</codeblock>

To see borders around the cells,
we need to specify `border` for
`th` and `td` selectors too:

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
    <td>Eve</td>
    <td>30</td>
    <td>Female</td>
  </tr>
</table>
</panel>
<panel language="css">
table, th, td {
  border: 1px solid darkgray;
}
</panel>
</code>
</codeblock>