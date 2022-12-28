When we need to style only one element on the page differently,
using a `class` selector is not the best way.

We can use the HTML `id` attribute to select that single element. The `#` symbol is used before the `id` name to select it.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2 id="title">
  Solar System
</h2>
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
</p>
<h2>
  The Sun
</h2>
<p>
  The Sun is the Solar System's star and by far its most massive component.
</p>
<h2>
  Earth
</h2>
<p>
  Earth is the largest and densest of the inner planets, the only one known to have current geological activity, and the only place where life is known to exist.
</p>
</panel>
<panel language="css">
#title {
  font-size: 36px;
}
p {
  color: darkblue;
}
</panel>
</code>
</codeblock>

In the above example, the `h2` element with the `id` **'title'** is affected by the styles. Note that the other `h2` elements remain unchanged.