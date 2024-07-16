Change the marker of the list items
to the image `orange-marker.png`. This
image is stored in the same place
where we have stored our css file.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h3>
  Planets of the Solar system
</h3>
<ol>
  <li>Mercury</li>
  <li>Venus</li>
  <li>Earth</li>
  <li>Mars</li>
  <li>Jupiter</li>
  <li>Saturn</li>
  <li>Uranus</li>
  <li>Neptune</li>
</ol>
</panel>
<panel language="css">
ol {
  line-height: 1.4;
}
</panel>
</code>

<solution>
ol {
  line-height: 1.4;
  list-style-image: url('orange-marker.png');
}
</solution>
</codeblock>