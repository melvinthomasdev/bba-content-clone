We can set the attributes for any
HTML element using the `setAttribute`
method.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div>
  <img>
</div>
</panel>
<panel language="css">
div {
  width: 480px;
  border: 16px solid palevioletred;
  margin: 1rem auto;
}

img {
  width: 100%;
  display: block;
}
</panel>
<panel language="javascript">
let imgElement = document.querySelector('img');
imgElement.setAttribute("src", "https://upload.wikimedia.org/wikipedia/commons/6/65/The_station_pictured_from_the_SpaceX_Crew_Dragon_1.jpg");
</panel>
</code>
</codeblock>

In the example given above, we are
setting the `src` attribute for
the `img` element. When using `setAttribute`,
we need to provide the property name
and the value of the property.
