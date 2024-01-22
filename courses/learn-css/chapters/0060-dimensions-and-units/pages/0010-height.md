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
  <img src="https://ucarecdn.com/239a6179-8e6a-4aca-ac0a-aa93e6881d1e/" alt="Fort Kochi Beach">
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