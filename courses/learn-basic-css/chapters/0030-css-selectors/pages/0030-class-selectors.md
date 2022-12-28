An element selector selects all the elements with that tag. But what if we need to give a different color only to the second and third headings?

In such cases, we can use the HTML `class` attribute to select elements. The `.` symbol is used before the class name to select the elements.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>
  Solar System
</h2>
<p>
  The Solar System is the gravitationally bound system of the Sun and the objects that orbit it, either directly or indirectly.
</p>
<h2 class="heading">
  The Sun
</h2>
<p>
  The Sun is the Solar System's star and by far its most massive component.
</p>
<h2 class="heading">
  Earth
</h2>
<p>
  Earth is the largest and densest of the inner planets, the only one known to have current geological activity, and the only place where life is known to exist.
</p>
</panel>
<panel language="css">
.heading {
  text-decoration: underline;
}
p {
  color: darkblue;
}
</panel>
</code>
</codeblock>

In the above example, the `h2` elements with the `class` **'heading'** are affected by the styles applied. Note that the other `h2` element without that class remains unchanged.
