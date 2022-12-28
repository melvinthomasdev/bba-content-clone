Remove the list element with the text **84 trees**
using the `remove` method.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<ul>
  <li>65 Butterflies</li>
  <li>29 Flowers</li>
  <li>84 trees</li>
  <li>1 sign</li>
</ul>
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let gardenList = document.querySelectorAll('li');
gardenList[2].remove();
</solution>
</codeblock>