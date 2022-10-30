Change the text inside the `h2` element
to - **Become a full-stack developer**
using `textContent`.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<h2>Become a front-end developer</h2>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let goal = document.querySelector('h2');
goal.textContent = "Become a full-stack developer";
</solution>
</Editor>