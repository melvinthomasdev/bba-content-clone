The `innerText` property returns the visible text
inside the element. Whereas `textContent` returns the
complete text, whether hidden from view or not.

<Editor lang="javascript">
<code>
<panel lang="html">
<p>Battle <span>of the sharpest minds</span></p>
</panel>
<panel lang="css">
span {
    display: none
}
</panel>
<panel lang="javascript">
let quote = document.querySelector('p');
console.log("-----");
console.log("innerText: ", quote.innerText);
console.log("textContent: ", quote.textContent);
</panel>
</code>
</Editor>

Look at the console result, and
you'll see that the `innerText` property
only returned the text **Battle**. This is because the other
text had the CSS property `display` set to `none`.
Whereas the `textContent` property returned
the complete text, **Battle of the sharpest minds**
regardless of whether the text was visible or not.
