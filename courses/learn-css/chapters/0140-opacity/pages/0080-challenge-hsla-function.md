Use `hsla` function to add an alpha of `0.7` to the background colour.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <p>
    Blue, the gentle whisper of the universe painted across the canvas
    of existence. It's the tranquil lullaby sung by the azure sky as it
    cradles the day into night. A colour that dances with the mysteries
    of the deep ocean, where shades of cobalt and cerulean weave tales
    of secrets hidden beneath the waves.
  </p>
</div>
</panel>
<panel language="css">
div {
  padding: 20px;
  height: 80vh;
  background-color: hsl(240, 100%, 50%);
}

p {
  font-size: 24px;
  color: #fff;
}
</panel>

</code>
<solution>
div {
  padding: 20px;
  height: 80vh;
  background-color: hsla(240, 100%, 50%, 0.7);
}

p {
  font-size: 24px;
  color: #fff;
}
</solution>
</codeblock>
