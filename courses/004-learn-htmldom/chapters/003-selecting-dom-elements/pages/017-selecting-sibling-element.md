**Sibling** elements share the same parent.
To find a sibling element immediately before
or immediately after an element, we use the
`nextElementSibling` or `previousElementSibling` property.

Take a look at the example given below:

<Editor lang="javascript">
<code>
<panel lang="html">
<section>
  <a href="#">A link to nowhere.</a><span> Nothing to note here.</span><strong> Absolutely nothing of value in this div.</strong>
</section>
</panel>
<panel lang="javascript">
let span = document.querySelector('span');
let nextElementSiblingOfSpan = span.nextElementSibling;
let prevElementSiblingOfSpan = span.previousElementSibling;
console.log(`Previous Sibling of the span element: ${prevElementSiblingOfSpan.nodeName.toLowerCase()}`);
console.log(`Next Sibling of the span element: ${nextElementSiblingOfSpan.nodeName.toLowerCase()}`);
</panel>
</code>
</Editor>

As can be seen, the next sibling
element of `span` is
the `strong` element and the previous
sibling element of `span` is the `a` element.