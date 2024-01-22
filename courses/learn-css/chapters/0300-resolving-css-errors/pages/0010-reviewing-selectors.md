Resolving CSS errors often
involves examining whether
the correct HTML element
has been selected.

Let us have a look at an example
where we want to have all headings
in red:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1>Hello, World!</h1>
<p>This is a paragraph.</p>
<div>
  <h2>Another heading</h2>
</div>
</panel>
<panel language="css">
h1 {
  color: red;
}

p {
  font-size: 18px;
}
</panel>
</code>
</codeblock>

The CSS selector **h1** targets
the `<h1>` element,
changing its color to red.

Similarly, the selector **p**
targets the `<p>` element,
adjusting its font size.

As we do that with the above code
we notice that we've added
an additional `<div>` element
which contains an `<h2>` element.

Additionally, the CSS rules are
targeting `<h1>`
and
`<p>` elements, but not the
`<h2>` element.
This would be an error.

Let us fix it by applying the same
CSS as `<h1>` element to `<h2>` as
well:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1>Hello, World!</h1>
<p>This is a paragraph.</p>
<div>
  <h2>Another heading</h2>
</div>
</panel>
<panel language="css">
h1, h2 {
  color: red;
}

p {
  font-size: 18px;
}
</panel>
</code>
</codeblock>

This ensures that the `color`
property applies to both headings.
