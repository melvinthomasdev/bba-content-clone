Remove all the HTML inside the `div` element
with the id **root** using the
`innerHTML` property.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<div id = "root">
  <h2>Another Day</h2>
  <p>Another awakening</p>
</div>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let theMainDiv = document.querySelector('#root');
theMainDiv.innerHTML = "";
</solution>
</Editor>