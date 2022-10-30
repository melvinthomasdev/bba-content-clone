The `font-weight` property is used to make text bolder or lighter.

We can use values such as `normal`, `bold`, `lighter`, `bolder`
for this. We can also use numbers in the multiples of 100
such as `100`, `200` and so on up to `900`.
Here `100` is the lightest and `900` is the `boldest`.

<Editor lang="css">
<code>
<panel lang="html">
<p id="first">
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
</p>
<p id="second">
  Of the objects that orbit the Sun directly, the largest are the eight planets, with the remainder being smaller objects, the dwarf planets and small Solar System bodies.
</p>
</panel>
<panel lang="css">
#first {
  font-weight: bold;
}
#second {
  font-weight: 400; /* Normal */
}
</panel>
</code>
</Editor>