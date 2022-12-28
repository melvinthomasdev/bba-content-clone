Change the text inside the `h2` element
to - **Become a full-stack developer**
using `textContent`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>Become a front-end developer</h2>
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let goal = document.querySelector('h2');
goal.textContent = "Become a full-stack developer";
</solution>
</codeblock>