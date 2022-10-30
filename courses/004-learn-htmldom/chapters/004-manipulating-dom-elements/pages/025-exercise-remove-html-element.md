Remove the list element with the text **84 trees**
using the `remove` method.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<ul>
  <li>65 Butterflies</li>
  <li>29 Flowers</li>
  <li>84 trees</li>
  <li>1 sign</li>
</ul>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let gardenList = document.querySelectorAll('li');
gardenList[2].remove();
</solution>
</Editor>