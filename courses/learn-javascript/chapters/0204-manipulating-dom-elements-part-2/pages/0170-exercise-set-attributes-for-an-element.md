Set the `src` attribute of the image
element with the value `https://www.nasa.gov/sites/default/files/thumbnails/image/stsci-h-p2109c-m-2000x1125.png`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img>
</panel>
<panel language="css">
img {
  width: 300px;
  border: 10px solid steelblue;
  display: block;
  margin: 1rem auto;
}
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let imgElement = document.querySelector('img');
imgElement.src = "https://www.nasa.gov/sites/default/files/thumbnails/image/stsci-h-p2109c-m-2000x1125.png";
</solution>
</codeblock>