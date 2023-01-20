Create a new `p` element
with the text **The biggest secrets are
still unexplored**. Append it to
the `article` element.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<article id = "main-article">
  <h2>Uncharted Territories</h2>
</article>
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let newHeading = document.createElement('p');
newHeading.textContent = "The biggest secrets are still unexplored"
let mainArticle = document.getElementById('main-article');
mainArticle.appendChild(newHeading);
</solution>
</codeblock>