We can control the space between
lines of text
using the `line-height` property.

The value can be in `px`, `em`, `%`,
or just a number like `1.5` or `2`.

The number value or percentage is used as a multiplier.
`line-height: 1.5` means the space
between the lines will be **1.5 times**
the size of the text.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="first">
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly. Of the objects that orbit the Sun directly, the largest are the eight planets,with the remainder being smaller objects, the dwarf planets and small Solar System bodies.
</p>
<hr>
<p id="second">
  The Solar System formed 4.6 billion years ago from the gravitational collapse of a giant interstellar molecular cloud. The vast majority of the system's mass is in the Sun, with the majority of the remaining mass contained in Jupiter.
</p>
<hr>
<p id="third">
  The four smaller inner planets, Mercury, Venus, Earth and Mars, are terrestrial planets, being primarily composed of rock and metal. The four outer planets are giant planets, being substantially more massive than the terrestrials.
</p>
</panel>
<panel language="css">
#first {
  line-height: 1em;
}
#second {
  line-height: 140%;
}
#third {
  line-height: 2;
}
</panel>
</code>
</codeblock>