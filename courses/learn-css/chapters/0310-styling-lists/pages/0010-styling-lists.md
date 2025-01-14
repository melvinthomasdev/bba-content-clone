HTML lists can be styled in all
the standard different ways in which
we style the HTML elements. But,
there are also some CSS properties
that are specific to lists.

**Marker Style**

For an unordered list, each item has
a little circular disc as the
marker type by default.
We can change this marker
using the property `list-style-type`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h3>
  Most spoken languages of the world
</h3>
<ul>
  <li>English</li>
  <li>Mandarin Chinese</li>
  <li>Hindi</li>
  <li>Spanish</li>
</ul>
</panel>
<panel language="css">
ul {
  list-style-type: square;
}
</panel>
</code>
</codeblock>

Other marker types available for
unordered lists are `disc` and `circle`.

For an ordered list, the default marker type
is decimal numbers. We can change this
with some values like `decimal`,
`upper-alpha`, `lower-roman` and `upper-roman`.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h3>
    Most spoken languages of the world
  </h3>
  <ol>
    <li>English</li>
    <li>Mandarin Chinese</li>
    <li>Hindi</li>
    <li>Spanish</li>
  </ol>
</panel>
<panel language="css">
ol {
  list-style-type: lower-alpha;
}
</panel>
</code>
</codeblock>

The value `none` can be used to
remove the markers for both types of lists.