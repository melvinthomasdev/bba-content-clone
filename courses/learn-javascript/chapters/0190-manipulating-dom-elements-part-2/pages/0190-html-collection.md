An **HTMLCollection** is returned by methods like `document.getElementsByClassName()`
and
`document.getElementsByTagName()`.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div class="container">
  <p>Paragraph 1</p>
  <p>Paragraph 2</p>
  <p>Paragraph 3</p>
</div>
</panel>
<panel language="javascript">
const container = document.querySelector('.container');
const paragraphsHTMLCollection = container.getElementsByClassName('paragraph');

console.log(paragraphsHTMLCollection);
// Output: HTMLCollection(3) [p, p, p]
</panel>
</code>
</codeblock>
