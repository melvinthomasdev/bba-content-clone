The `div` and `p` elements have their default `display` set to `block`. Some more *block-level* elements are the heading elements - `h1` to `h6`, `header`, `footer`, `section` and `form`.

Block elements start on a new line, occupy 100% width by default, and can have `height`, `width` properties and also have functional `margin` on all four sides.

We can make elements like `span`, `a` and `img` behave like block-level elements by setting their `display` property to `block`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
Example 1: <span>Now span also starts on a new line</span><br>
Example 2: <p>Paragraph starts on a new line and occupies 100% width</p>
<a href="#">Link 1</a>
<a href="#">Link 2 in the next line</a>
</panel>
<panel language="css">
p {
  background-color: yellow;
  margin-top: 30px;
}
span, a {
  display: block;
  background-color: orange;
  margin-top: 30px;
}
</panel>
</code>
</codeblock>

As can be seen, `span` and `a` elements
behave like block elements after their `display`
property is set to **block**. They start in a new line
and occupy all the available width.