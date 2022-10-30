Select the second paragraph using
the `nextElementSibling` property and
store it in the `nextElem` variable.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<p id = "initial-thoughts">Initial Thoughts</p>
<p>Let's add more ideas.</p>
</panel>
<panel lang="javascript">
let firstElem = document.querySelector("#initial-thoughts");
let nextElem = ;
console.log(`The text in the second paragraph: ${nextElem.textContent}`);
</panel>
</code>

<solution>
let firstElem = document.querySelector("#initial-thoughts");
let nextElem = firstElem.nextElementSibling;
console.log(`The text in the second paragraph: ${nextElem.textContent}`);
</solution>
</Editor>