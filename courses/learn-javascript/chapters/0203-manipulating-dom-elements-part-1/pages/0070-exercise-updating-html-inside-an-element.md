Remove all the HTML inside the `div` element
with the id **root** using the
`innerHTML` property.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="root">
  <h2>Another Day</h2>
  <p>Another awakening</p>
</div>
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let theMainDiv = document.querySelector('#root');
theMainDiv.innerHTML = "";
</solution>
</codeblock>