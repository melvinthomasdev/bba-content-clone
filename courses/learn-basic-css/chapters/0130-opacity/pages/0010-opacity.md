The `opacity` property is used
to define transparency for elements.

You can specify any value between `0.0` and `1.0`.

Here, `0` is fully transparent,
`0.5` is semi-transparent
and `1` is fully opaque.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<button id="first">
  Click me first
</button>
<button id="second">
  Click me later
</button>
</panel>
<panel language="css">
button {
  padding: 8px 12px;
  background-color: purple;
  color: white;
  font-size: 1em;
}
#first {
  opacity: 1;
  /* Default value */
}
#second {
  opacity: 0.3;
}
</panel>
</code>
</codeblock>

Try changing the opacity value to `0.3` in the above editor.