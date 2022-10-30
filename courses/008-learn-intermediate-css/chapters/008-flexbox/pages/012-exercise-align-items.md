Make the image and paragraph
vertically align at the center:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<article>
  <img src="waterfall.jpg" alt="Waterfall"/>
  <p>
    A waterfall is a point in a river or stream where water flows over a vertical drop or a series of steep drops. Waterfalls also occur where meltwater drops over the edge of a tabular iceberg or ice shelf.
  </p>
</article>
</panel>
<panel lang="css">
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
</Editor>