Set `background-color` to **orange**
for every 3rd `span` element
within the `div`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h2>Student names</h2>
  <span>Eve Smith</span>
  <span>Sam Smith</span>
  <span>Renu Sen</span>
  <span>Lao Xun</span>
  <span>John Doe</span>
  <span>Linh Tran</span>
  <span>Jane Doe</span>
  <span>Chinua Achebe</span>
  <span>Carlos Alberti</span>
</div>
</panel>
<panel language="css">
span {
  display: inline-block;
  margin-right: 4px;
  padding: 5px 8px;
  border-radius: 3px;
  background-color: lightgray;
}
</panel>
</code>

<solution>
span {
  display: inline-block;
  margin-right: 4px;
  padding: 5px 8px;
  border-radius: 3px;
  background-color: lightgray;
}
span:nth-of-type(3n) {
  background-color: orange;
}
</solution>
</codeblock>