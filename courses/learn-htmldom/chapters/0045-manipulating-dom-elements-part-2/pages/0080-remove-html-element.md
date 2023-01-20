We can remove HTML elements from the
DOM using the `remove` method.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>This paragraph will be removed.</p>
<p>This paragraph will not be removed.</p>
</panel>
<panel language="javascript">
let allParagraphs = document.querySelectorAll('p');
allParagraphs[0].remove();
</panel>
</code>
</codeblock>