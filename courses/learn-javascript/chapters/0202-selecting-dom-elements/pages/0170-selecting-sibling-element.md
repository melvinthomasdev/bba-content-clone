**Sibling** elements share the same parent.
To find a sibling element immediately before
or immediately after an element, we use the
`nextElementSibling` or `previousElementSibling` property.

Take a look at the example given below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div>
  <a href="#">A link to nowhere.</a>
  <h1> Nothing to note here.</h1>
  <strong> Absolutely nothing of value in this div.</strong>
</div>
</panel>
<panel language="javascript">
let h1 = document.querySelector('h1');
let nextElementSiblingOfh1 = h1.nextElementSibling;
let prevElementSiblingOfh1 = h1.previousElementSibling;
console.log(`Previous Sibling of the h1 element: ${prevElementSiblingOfh1.nodeName.toLowerCase()}`);
console.log(`Next Sibling of the h1 element: ${nextElementSiblingOfh1.nodeName.toLowerCase()}`);
</panel>
</code>
</codeblock>

As can be seen, the next sibling
element of `h1` is
the `strong` element and the previous
sibling element of `h1` is the `a` element.

Let's take a look at another example:
<codeblock language="javascript" type="lesson">
<panel language="html">
<section>
  <a href="https://www.wikipedia.org/">A link to wikipedia.</a>
  <span> The Free Encyclopedia </span>
  <strong> A lot to learn here.</strong>
</section>
</panel>
</codeblock>
