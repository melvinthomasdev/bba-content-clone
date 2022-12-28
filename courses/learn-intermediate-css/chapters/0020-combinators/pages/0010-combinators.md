We can select an element directly using
its class, or id, or the
tag name. But sometimes, we need to
select elements based on their relationship
with other elements. For example,
how will we select all paragraphs
that are nested inside a `div`?

Look at the example given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <p>
    This Paragraph will be blue because it is within a div
  </p>
</div>
<p>
  This Paragraph will be black because the style changes don't apply to it.
</p>
</panel>
<panel language="css">
div > p {
  color: blue;
}
</panel>
</code>
</codeblock>

Here, `>` is a **combinator**.
Notice that the styles were
only applied to the `p` elements
**within** a `div`.