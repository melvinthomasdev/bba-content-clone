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
const h1 = document.querySelector('h1');
const nextElementSiblingOfh1 = h1.nextElementSibling;
const prevElementSiblingOfh1 = h1.previousElementSibling;
console.log(`Previous Sibling of the h1 element: ${prevElementSiblingOfh1.nodeName.toLowerCase()}`);
console.log(`Next Sibling of the h1 element: ${nextElementSiblingOfh1.nodeName.toLowerCase()}`);
</panel>
</code>
</codeblock>

As can be seen, the next sibling element of `h1` is the `strong` element and the previous sibling element of `h1` is the `a` element.

Let's take a look at another example:
<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div>
  <h1>BigBinary Academy Courses</h1>
  <ul class="course-list">
    <li>HTML</li>
    <li>CSS</li>
    <li>JavaScript</li>
    <li>React</li>
    <li>Ruby</li>
    <li>Ruby on Rails</li>
  </ul>
  <p>Learn coding by actually coding.</p>
</div>
</panel>
<panel language="javascript">
const ul = document.querySelector('.course-list');
const nextElementSiblingOfUl = ul.nextElementSibling;
const prevElementSiblingOfUl = ul.previousElementSibling;
console.log(`Previous Sibling of the ul element: ${prevElementSiblingOfUl.nodeName.toLowerCase()}`);
console.log(`Next Sibling of the ul element: ${nextElementSiblingOfUl.nodeName.toLowerCase()}`);
</panel>
</code>
</codeblock>

As can be seen, the next sibling element of `ul` is the `p` element and the previous sibling element of `ul` is the `h1` element.