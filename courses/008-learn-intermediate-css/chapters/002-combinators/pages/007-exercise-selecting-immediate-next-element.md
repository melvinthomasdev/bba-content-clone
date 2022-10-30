Set `display` property to
`block` for the `span` element
that immediately follows the
image element:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<img src="waterfall.jpg" alt="waterfall"/>
  <span>Caption: Waterfall</span>
  <p>
    <span>A waterfall</span> is a point in a river or stream where water flows over a vertical drop or a series of steep drops. Waterfalls also occur where meltwater drops over the edge of a tabular iceberg or ice shelf.
  </p>
</panel>
<panel lang="css">
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
</Editor>