Select the second paragraph using
the `nextElementSibling` property and
store it in the `nextElem` variable.


<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p id="initial-thoughts">Initial Thoughts</p>
<p>Let's add more ideas.</p>
</panel>
<panel language="javascript">
let firstElem = document.querySelector("#initial-thoughts");
let nextElem = ;
console.log(`The text in the second paragraph: ${nextElem.textContent}`);
</panel>
</code>
<solution>
<panel language="html">
<p id="initial-thoughts">Initial Thoughts</p>
<p>Let's add more ideas.</p>
</panel>
<panel language="javascript">
let firstElem = document.querySelector("#initial-thoughts");
let nextElem = firstElem.nextElementSibling;
console.log(`The text in the second paragraph: ${nextElem.textContent}`);
</panel>
</solution>
</codeblock>
