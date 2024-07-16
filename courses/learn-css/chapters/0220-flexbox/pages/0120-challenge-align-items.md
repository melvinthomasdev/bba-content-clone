Make the image and paragraph
vertically align at the center:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<article>
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/waterfall_oKIDF4G6S.jpg" alt="Waterfall">
  <p>
    A waterfall is a point in a river or stream where water flows over a vertical drop or a series of steep drops. Waterfalls also occur where meltwater drops over the edge of a tabular iceberg or ice shelf.
  </p>
</article>
</panel>
<panel language="css">
article {
  display: flex;
}
p {
  padding-left: 20px;
}

img {
  width: 250px;
}
</panel>
</code>

<solution>
article {
  display: flex;
  align-items: center;
}
p {
  padding-left: 20px;
}

img {
  width: 250px;
}
</solution>
</codeblock>
