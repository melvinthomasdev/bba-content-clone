We can style specific rows of a table
using pseudo classes like `:first-child`,
`:last-child` and so on,
along with the `tr` selector:

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
  padding: 10px;
}
tr:last-child {
  background-color: lightgray;
}
</panel>
</code>
</codeblock>

Try changing the above
selector to `tr:first-child`.

Apart from first and last child,
we can select a specific child,
or a row, using the `:nth-child`
pseudo class:

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
  padding: 10px;
}
tr:nth-child(2) {
  color: blue;
}
</panel>
</code>
</codeblock>

Try changing the above selector to `tr:nth-child(1)` or `tr:nth-child(3)`.

The `:nth-child` class can also be used to select `odd` and `even` rows:

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
    <td>Sam Smith</td>
    <td>25</td>
    <td>Male</td>
  </tr>
  <tr>
    <td>Eve Smith</td>
    <td>30</td>
    <td>Female</td>
  </tr>
  <tr>
    <td>Renu Sen</td>
    <td>24</td>
    <td>Female</td>
  </tr>
  <tr>
    <td>Lao Xun</td>
    <td>32</td>
    <td>Male</td>
  </tr>
  <tr>
    <td>Carlos Alberti</td>
    <td>28</td>
    <td>Male</td>
  </tr>
</table>
</panel>
<panel language="css">
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 10px;
}
tr:nth-child(even) {
  background-color: #e5e5e5;
}
</panel>
</code>
</codeblock>

Try changing `even` to `odd` in the above example.
