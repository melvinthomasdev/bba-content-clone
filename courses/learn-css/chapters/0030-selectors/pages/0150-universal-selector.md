Sometimes, we need to apply
some common styles to all elements
on a web page. For this, we can use
the universal selector `*`.
This applies the specified
styles to all the elements:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>
  Solar System
</h2>
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
</p>
<a href="#">Read more</a>
</panel>
<panel language="css">
* {
  color: darkgreen;
}
</panel>
</code>
</codeblock>

In the above example, the universal
selector applies the
font colour to each element.