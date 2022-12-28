The following `div` has a width of `100%`.
But it exceeds the window width
because it uses the standard box model
to calculate the final width.

Use the `box-sizing` property to make the `div`
including its padding and border occupy 100% width and
still not exceed the window width.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe seasonal changes in atmospheric circulation and precipitation associated with the asymmetric heating of land and sea.
</div>
</panel>
<panel language="css">
div {
  background-color: lightgreen;
  width: 100%;
  padding: 40px;
  border: solid 10px darkgreen;
}
</panel>
</code>

<solution>
div {
  background-color: lightgreen;
  width: 100%;
  padding: 40px;
  border: solid 10px darkgreen;
  box-sizing: border-box;
}
</solution>
</codeblock>