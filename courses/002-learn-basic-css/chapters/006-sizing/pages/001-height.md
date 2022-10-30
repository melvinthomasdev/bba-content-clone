The `height` property is used to
set the height of an element.
Height can be defined in percentage `%`
or pixels `px`.

Percentage height is calculated based on
the height of the immediate parent element.
<Editor lang="css">
<code>
<panel lang="html">
<p>
  The div given below is set to 200px height and the image is set to 50% of the height of the div
</p>
<div>
  <img src="fort-kochi-beach.jpg" alt="Fort Kochi Beach">
</div>
</panel>
<panel lang="css">
div {
  height: 200px;
  background-color: #f5f5f5;
}
img {
  height: 50%;
}
</panel>
</code>
</Editor>