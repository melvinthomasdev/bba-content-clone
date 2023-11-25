The `<tbody>` element is used to
organize the body of a table.

It doesn't change anything in
the table's layout. But, it is used to
give the table's HTML, a proper structure.

<codeblock language="html" type="lesson">
<code>
<table>
  <caption>Books</caption>
  <thead>
    <tr>
      <th>Type</th>
      <th>Count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Children</td>
      <td>34</td>
    </tr>
    <tr>
      <td>Nature</td>
      <td>28</td>
    </tr>
    <tr>
      <td>Fantasy</td>
      <td>35</td>
    </tr>
    <tr>
      <td>Geography</td>
      <td>6</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Total</td>
      <td>103</td>
    </tr>
  </tfoot>
</table>
</code>
</codeblock>

All the rows after the `thead`
and
before the `tfoot` elements can be
placed inside the `tbody` element.

This way, the whole table gets a good
clean layout, with `caption` at the top,
`thead` as the header, `tbody` comprising
all the data and `tfoot` making up the
footer.
