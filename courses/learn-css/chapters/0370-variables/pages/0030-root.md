The `root` element is a
global selector.

It allows us to define
css properties that will be
inherited by other css elements
throughout the page.

The syntax to define a property
in `root` is:
```css
:root {
  property-name: property-value;
}
```

It is necessary to use colon `:`
as a prefix in `root`.
It signifies that `root` is
a pseudo-class selector.

If we omit the colon `:`,
the code will look for an
**HTML tag** named "root",
to apply the CSS properties
which are defined.

Let us take a look at
an example of defining `root`.
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <h1>McDonald's</h1>
  <p>I'm loving it!</p>
</div>
</panel>
<panel language="css">
:root {
  color: yellow;
}
</panel>
</code>
</codeblock>

As we can see from the above
code, the color of **h1**
and **p** tags is `yellow`
as defined inside of `root`.
