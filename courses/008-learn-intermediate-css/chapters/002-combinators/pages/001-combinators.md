We can select an element directly using
its class, or id, or the
tag name. But sometimes, we need to
select elements based on their relationship
with other elements. For example,
how will we select all paragraphs
that are nested inside a `div`?

Look at the example given below:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <p>
    This Paragraph will be blue because it is within a div
  </p>
</div>
<p>
  This Paragraph will be black because the style changes don't apply to it.
</p>
</panel>
<panel lang="css">
div > p {
  color: blue;
}
</panel>
</code>
</Editor>

Here, `>` is a **combinator**.
Notice that the styles were
only applied to the `p` elements
**within** a `div`.