We can control the spacing
between letters of the text
using the `letter-spacing` property.

A positive value increases the space between
the letters in a word, while a negative
value decreases it.

<Editor lang="css">
<code>
<panel lang="html">
<h1>The Solar System</h1>
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
</p>
</panel>
<panel lang="css">
h1 {
    letter-spacing: -3px;
  }
  p {
    letter-spacing: 0.2em;
  }
</panel>
</code>
</Editor>