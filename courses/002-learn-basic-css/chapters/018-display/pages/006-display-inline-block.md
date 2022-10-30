Sometimes it's helpful to have elements
display in the same line but also behave
like block-level elements with
specified height and width.

This can be achieved with the
`display` value of `inline-block`:

<Editor lang="css">
<code>
<panel lang="html">
<p>Some links for your reference:</p>
<a href="#">Link 1</a>
<a href="#">Link 2</a>
</panel>
<panel lang="css">
a {
  display: inline-block;
  background-color: orange;
  width: 150px;
  height: 50px;
  line-height: 50px;
  margin-top: 50px;
}
</panel>
</code>
</Editor>