Shift the image from the left by
**50%** using `position:relative`
and the `left` property:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img src="munnar-kerala-06.jpg" alt="Munnar Kerala">
</panel>
<panel language="css">
img {
  width: 50%;
}
</panel>
</code>

<solution>
img {
  width: 50%;
  position: relative;
  left: 50%;
}
</solution>
</codeblock>