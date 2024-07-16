We can also change some
styles based on whether
our web page is being
viewed in *portrait*
or *landscape* orientation:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly. Of the objects that orbit the Sun directly, the largest are the eight planets, with the remainder being smaller objects, the dwarf planets and small Solar System bodies.
</p>
</panel>
<panel language="css">
p {
  width: 50%;
}
@media screen and (orientation: portrait) {
  p {
    width: 100%;
  }
}
</panel>
</code>
</codeblock>

**Portrait** orientation is
when the screen width is
smaller than the height
and
**landscape** is when screen
width is larger than the
height.

Resize the output
panel to a width smaller
than the height to notice
that the paragraph width
changes to **100%**.