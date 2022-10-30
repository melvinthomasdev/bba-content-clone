We can make our text
align the way we want,
using the `text-align` property.

We can use the values
`left`, `right`,
`center` or `justify` to
align the text accordingly.

<Editor lang="css">
<code>
<panel lang="html">
<h2>
  Solar System
</h2>
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly. Of the objects that orbit the Sun directly, the largest are the eight planets,with the remainder being smaller objects, the dwarf planets and small Solar System bodies.
</p>
<h2>
  Inner planets in the Solar System
</h2>
<ul>
  <li>Mercury</li>
  <li>Venus</li>
  <li>Earth</li>
  <li>Mars</li>
</ul>
<p id="credits">Information from Wikipedia</p>
</panel>
<panel lang="css">
h2 {
  text-align: center;
}
p {
  text-align: justify;
}
ul {
  text-align: left;
  /* This is the default value */
}
#credits {
  text-align: right;
}
</panel>
</code>
</Editor>

As can be seen in the code editor, the text on our web pages is left aligned by default.