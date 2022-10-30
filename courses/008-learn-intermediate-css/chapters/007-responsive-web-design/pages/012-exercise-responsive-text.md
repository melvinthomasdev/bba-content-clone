Change font size of the
heading to **2.2rem** and that
of the paragraph to **1.3rem**
on devices with screen widths
larger than **992px**:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<h2>Solar System</h2>
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly. Of the objects that orbit the Sun directly, the largest are the eight planets, with the remainder being smaller objects, the dwarf planets and small Solar System bodies.
</p>
<h2>The Sun</h2>
<p>
  The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy mainly as visible light, ultraviolet light, and infrared radiation. It is by far the most important source of energy for life on Earth.
</p>
</panel>
<panel lang="css">
h2 {
  font-size: 1.8rem;
}
p {
  font-size: 1.1rem;
  line-height: 1.4;
}
</panel>
</code>

<solution>
h2 {
  font-size: 1.8rem;
}
p {
  font-size: 1.1rem;
  line-height: 1.4;
}
@media screen and (min-width: 992px) {
  h2 {
    font-size: 2.2rem;
  }
  p {
    font-size: 1.3rem;
  }
}
</solution>
</Editor>