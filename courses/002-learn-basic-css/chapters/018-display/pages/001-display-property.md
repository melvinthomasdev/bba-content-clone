When working with different types of elements, we notice something interesting. Elements like the `div` and `p` always start on a new line, and stretch to completely fit in the available width. But elements like `span` and `a` do not create a new line and only take up as much space as needed.

<Editor lang="css">
<code>
<panel lang="html">
Example 1: <span>Span doesn't start on a new line</span><br>
Example 2: <p>Paragraph starts on a new line and occupies 100% width</p>
<a href="#">Link 1</a>
<a href="#">Link 2 in the same line</a>
</panel>
<panel lang="css">
p, span {
  background-color: yellow;
}
</panel>
</code>
</Editor>

This behaviour is set by the elements' `display` property.