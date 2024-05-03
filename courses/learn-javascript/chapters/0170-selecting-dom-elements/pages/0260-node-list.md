A **NodeList** is returned by methods like
`document.querySelectorAll()`
and
represents a collection of nodes in the document.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div class="box">Box 1</div>
<div class="box">Box 2</div>
<div class="box">Box 3</div>
</panel>
<panel language="javascript">
// Accessing NodeList using querySelectorAll
const boxes = document.querySelectorAll('.box');
// Outputs NodeList containing 3 div elements
console.log(boxes);
</panel>
</code>
</codeblock>
