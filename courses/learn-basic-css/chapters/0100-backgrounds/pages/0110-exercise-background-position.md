Position the background image to the bottom left corner of the `div`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h1>Background Position in CSS</h1>
</div>
</panel>
<panel language="css">
div {
  height: 300px;
  background-image: url('https://images.pexels.com/photos/41551/brown-brunette-female-finger-41551.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
  background-repeat: no-repeat;
}
</panel>
</code>

<solution>
div {
  height: 300px;
  background-image: url('https://images.pexels.com/photos/41551/brown-brunette-female-finger-41551.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
  background-repeat: no-repeat;
  background-position: left bottom;
}
</solution>
</codeblock>