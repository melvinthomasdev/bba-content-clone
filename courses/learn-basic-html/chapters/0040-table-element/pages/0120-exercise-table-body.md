In the following table,
group everything between the
`thead` and `tfoot` elements in
a `tbody` element.

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<table>
  <thead>
    <tr>
      <th>Medical Equipment</th>
      <th>Quantity</th>
    </tr>
  </thead>
  <tr>
    <td>Masks</td>
    <td>200</td>
  </tr>
  <tr>
    <td>Surgical Masks</td>
    <td>100</td>
  </tr>
  <tr>
    <td>Thermometers</td>
    <td>12</td>
  </tr>
  <tr>
    <td>Syringes</td>
    <td>1000</td>
  </tr>
  <tr>
    <td>Needles</td>
    <td>3000</td>
  </tr>
  <tfoot>
    <tr>
      <th>Total Units</th>
      <th>4312</th>
    </tr>
  </tfoot>
</table>
</code>

<solution>
<table>
  <thead>
    <tr>
      <th>Medical Equipment</th>
      <th>Quantity</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Masks</td>
      <td>200</td>
    </tr>
    <tr>
      <td>Surgical Masks</td>
      <td>100</td>
    </tr>
    <tr>
      <td>Thermometers</td>
      <td>12</td>
    </tr>
    <tr>
      <td>Syringes</td>
      <td>1000</td>
    </tr>
    <tr>
      <td>Needles</td>
      <td>3000</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th>Total Units</th>
      <th>4312</th>
    </tr>
  </tfoot>
</table>
</solution>
</codeblock>