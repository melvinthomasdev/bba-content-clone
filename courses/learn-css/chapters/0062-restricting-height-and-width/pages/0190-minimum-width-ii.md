If the element's `width` is larger
than the value of `min-width`, the `min-width`
property has no effect, and the element's
`width` expands based on its assigned width.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="box"></div>
</panel>
<panel language="css">
.box {
  width: 600px;
  min-width: 500px;
  height: 100px;
  background: #557ADA;
  border-radius: 5px;
  border: 2px solid black;
}
</panel>
</code>
</codeblock>

In this example, the `min-width` is set to `500px`,
but since the assigned width is larger than this value,
the `min-width` property has no effect.
