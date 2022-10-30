In the example given below, all the `h2` elements in the page will have an underline and all the text in the `p` elements on the page will be dark blue in color.

<Editor lang="css">
<code>
<panel lang="html">
<h2>
  Solar System
</h2>
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
</p>
<h2>
  The Sun
</h2>
<p>
  The Sun is the Solar System's star and by far its most massive component.
</p>
</panel>
<panel lang="css">
h2 {
  text-decoration: underline;
}
p {
  color: darkblue;
}
</panel>
</code>
</Editor>

Selectors like `h2` and `p` are **Element Selectors**. They select elements using their HTML tag name.
