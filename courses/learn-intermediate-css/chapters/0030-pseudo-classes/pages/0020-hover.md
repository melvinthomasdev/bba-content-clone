When a user takes the mouse pointer over an element,
you can style it differently by
appending `:hover` to the selector:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  Hover over this paragraph to see some color change. Also hover over each of the links below
</p>
<a href="#" id="link1">
  Link 1
</a><br></br>
<a href="#" id="link2">
  Link 2
</a>
</panel>
<panel language="css">
p:hover {
  color: brown;
}
#link1:hover {
  text-decoration: none;
}
#link2:hover {
  color: green;
}
</panel>
</code>
</codeblock>

You can also change styles of
another element when one element
is hovered, using CSS combinators:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  Hover over me to see the paragraph element
</div>
<p>
  You can see me
</p>
</panel>
<panel language="css">
p {
  position: absolute;
  display: none;
  background-color: orange;
  padding: 8px;
}

div:hover + p {
  display: block;
}
</panel>
</code>
</codeblock>