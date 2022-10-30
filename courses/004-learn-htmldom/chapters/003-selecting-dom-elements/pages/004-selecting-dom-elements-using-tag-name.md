To select a group of elements, we
target either their tag
names or their class names.

`getElementsByTagName` will select all
the HTML elements which match the
provided tag name.

The method returns an array-like list
of elements. So, we can access a specific
element using the bracket notation, `[]`. But,
none of the array methods will work though.

<Editor lang="javascript">
<code>
<panel lang="html">
<h2>Interesting Choice of Words</h2>
<p>A paragraph that states nothing new.</p>
<p>A paragraph that could have been interesting.</p>
<p>This paragraph doesn't inspire.</p>
</panel>
<panel lang="javascript">
let allParagraphs = document.getElementsByTagName('p');

for(let para of allParagraphs) {
  para.style.fontSize = "24px";
}
</panel>
</code>
</Editor>

In the example given above, we get the
list of `p` elements, and then we loop
over them to apply changes to each one
of them.

If you want to use the array methods,
you can convert the list
to an array using the `Array.from()`
method.