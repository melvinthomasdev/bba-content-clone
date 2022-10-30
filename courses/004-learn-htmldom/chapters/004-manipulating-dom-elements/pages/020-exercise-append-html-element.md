Create a new `p` element
with the text **The biggest secrets are
still unexplored**. Append it to
the `article` element.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<article id = "main-article">
  <h2>Uncharted Territories</h2>
</article>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let newHeading = document.createElement('p');
newHeading.textContent = "The biggest secrets are still unexplored"
let mainArticle = document.getElementById('main-article');
mainArticle.appendChild(newHeading);
</solution>
</Editor>