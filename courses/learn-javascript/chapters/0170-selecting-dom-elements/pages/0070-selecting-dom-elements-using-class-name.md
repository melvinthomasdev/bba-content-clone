`getElementsByClassName` will select all
the HTML elements which match the provided
class name.

The method returns an array-like list
of elements. So, we can access a specific
element using the bracket notation, `[]`.
None of the array methods will work though.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h2 class="heading">The most inspiring words</h2>
<p class="inspirational-words">Win!</p>
<p class="inspirational-words">You are the one!</p>
<p>Deadline!</p>
</panel>
<panel language="javascript">
let inspirationalWords = document.getElementsByClassName('inspirational-words');
for(let inspiration of inspirationalWords) {
  inspiration.style.fontWeight = "700";
  inspiration.style.textTransform = "uppercase";
}
</panel>
</code>
</codeblock>

In the example given above, we get the
list of all `p` elements with the class name
**inspirational-words**
and
then loop over it to
apply changes to each one of them. You can see
that the changes do not apply to the last `p`
element, because it does not belong to the
**inspirational-words** class.

If you want to use the array methods,
you can convert the list
to an array using the `Array.from()`
method.
