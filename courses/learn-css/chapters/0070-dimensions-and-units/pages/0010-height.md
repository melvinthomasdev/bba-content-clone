The `height` property is used to
set the height of an element.
Height can be defined in percentage `%`
or pixels `px`.

Percentage height is calculated based on
the height of the immediate parent element.
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  The div given below is set to 200px height and the image is set to 50% of the height of the div
</p>
<div>
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/fort-kochi-beach_oxymW955x.jpg" alt="Fort Kochi Beach">
</div>
</panel>
<panel language="css">
div {
  height: 200px;
  background-color: #f5f5f5;
}
img {
  height: 50%;
}
</panel>
</code>
</codeblock>
