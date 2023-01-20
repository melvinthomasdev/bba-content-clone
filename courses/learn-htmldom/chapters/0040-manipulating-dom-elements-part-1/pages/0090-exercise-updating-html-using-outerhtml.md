Replace the `div` element and all
the HTML inside it, with a `p` element
holding the text **I have been changed!**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id = "root">
  <h2>Original Work</h2>
  <p>Completely original writing!</p>
</div>
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let originalWork = document.querySelector('#root');
originalWork.outerHTML = "<p>I have been changed!</p>";
</solution>
</codeblock>