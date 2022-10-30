We can remove HTML elements from the
DOM using the `remove` method.

<Editor lang="javascript">
<code>
<panel lang="html">
<p>This paragraph will be removed.</p>
<p>This paragraph will not be removed.</p>
</panel>
<panel lang="javascript">
let allParagraphs = document.querySelectorAll('p');
allParagraphs[0].remove();
</panel>
</code>
</Editor>