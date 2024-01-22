If the element's `width` is smaller
than the value of `max-width`, the `max-width`
property has no effect, and the element's width
remains based on its assigned width.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="box"></div>
</panel>
<panel language="css">
.box {
  width: 300px;
  max-width: 500px;
  height: 100px;
  background: #557ADA;
  border-radius: 5px;
  border: 2px solid black;
}
</panel>
</code>
</codeblock>

In this example, the `max-width` is set to `500px`,
but since the assigned width is smaller than this value,
the `max-width` property has no effect.
