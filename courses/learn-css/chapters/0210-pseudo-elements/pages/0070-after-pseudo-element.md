When you want to add something at the
end of an element without actually
adding it in the HTML, you can use the
`::after` pseudo-element to do so,
with the help of the `content` property.
You can then style that content
just like any other element:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>A Styled Heading</h2>
</panel>
<panel language="css">
h2::before, h2::after {
  content: '';
  display: inline-block;
  width: 100px;
  border-top: 3px solid lightgray;
  margin: 6px 10px;
}
</panel>
</code>
</codeblock>

The above example makes use of
both `::before` and `::after`
to add decorative lines on
both sides of a heading.