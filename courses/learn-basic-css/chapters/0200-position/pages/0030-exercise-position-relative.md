Shift the image from the left by
**50%** using `position:relative`
and the `left` property:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img src="https://ucarecdn.com/96cdd519-8f8f-4609-80e2-7e0dbae38b6b/" alt="Munnar Kerala">
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