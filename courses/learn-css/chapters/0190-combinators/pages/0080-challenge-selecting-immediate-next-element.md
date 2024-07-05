Set `display` property to
`block` for the `span` element
that immediately follows the
image element:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/waterfall_oKIDF4G6S.jpg" alt="waterfall">
  <span>Caption: Waterfall</span>
  <p>
    <span>A waterfall</span> is a point in a river or stream where water flows over a vertical drop or a series of steep drops. Waterfalls also occur where meltwater drops over the edge of a tabular iceberg or ice shelf.
  </p>
</panel>
<panel language="css">
img {
    width: 300px;
}
</panel>
</code>

<solution>
img {
    width: 300px;
}
img + span {
  display: block;

}
</solution>
</codeblock>
