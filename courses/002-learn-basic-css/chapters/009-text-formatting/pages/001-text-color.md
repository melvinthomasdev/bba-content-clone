We can set the colour of the text in any element on the web page
using its `color` property.

The values can be **color names**, **HEX values**, or **RGB values**.

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
  Planets in the Solar System
</h2>
<ul>
  <li>Mercury</li>
  <li>Venus</li>
  <li>Earth</li>
  <li>Mars</li>
  <li>Jupiter</li>
  <li>Saturn</li>
  <li>Uranus</li>
  <li>Neptune</li>
</ul>
</panel>
<panel lang="css">
h2 {
  color: purple;
}
p {
  color: #dc143c;
  /* Crimson */
}
ul {
  color: rgb(0, 139, 139);
  /* DarkCyan */
}
</panel>
</code>
</Editor>