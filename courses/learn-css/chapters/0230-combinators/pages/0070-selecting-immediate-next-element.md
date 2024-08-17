When we need to select the immediate
next element, we use the `+` character
like this:

```
h1 + p
```

`h1 + p` will select a `p`
element that immediately follows
an `h1` element. The two elements
should be on the same nesting level.
This means that they should both
be the direct child of the same
parent.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1>Lotus</h1>
<p>
  Binomial name: Nelumbo nucifera
</p>
<p>
  Lotus plants are adapted to grow in the flood plains of slow-moving rivers and delta areas. Stands of lotus drop hundreds of thousands of seeds every year to the bottom of the pond.
</p>
</panel>
<panel language="css">
h1 + p {
  font-weight: bold;
  font-size: 1.1em;
  color: green;
}
</panel>
</code>
</codeblock>

Only the `p` element that
immediately follows
an `h1` is selected. No other `p` elements are selected.
Try adding a `span` element between
`h1` and `p` in the HTML
markup above. You'll see that now
no element will be selected.

These elements that are
children of a common parent and
are at the same nested level
are called **siblings**.