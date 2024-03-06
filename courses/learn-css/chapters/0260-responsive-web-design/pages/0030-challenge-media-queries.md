In the example given below,
the div elements with the class `.col`
have **48%** width
and
the `float` property is set
to **left**.

Using media queries, set the
width of `.col` to **98%**
and
`float` to **none** for a
maximum screen width of **767px**:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="col">
  <h2>Solar System</h2>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly. Of the objects that orbit the Sun directly, the largest are the eight planets, with the remainder being smaller objects, the dwarf planets and small Solar System bodies
</div>
<div class="col">
  <h2>The Sun</h2>
  The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy mainly as visible light, ultraviolet light, and infrared radiation. It is by far the most important source of energy for life on Earth.
</div>
</panel>
<panel language="css">
.col {
  width: 48%;
  float: left;
  margin: 1%;
}
</panel>
</code>

<solution>
.col {
  width: 48%;
  float: left;
  margin: 1%;
}
@media screen and (max-width: 767px) {
  .col {
    width: 98%;
    float: none;
  }
}
</solution>
</codeblock>