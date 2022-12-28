We can underline text, strike through it
or remove an underline using the<br>
`text-decoration` property.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>
  Item Price
</h2>
<div>
  <span id="old-price">
    $345/-
  </span>
  <span id="new-price">
    $299/-
  </span>
</div>
<a href="#">
  Click here to buy now
</a>
</panel>
<panel language="css">
h2 {
  text-decoration: underline;
}
#old-price {
  text-decoration: line-through;
}
a {
  text-decoration: none;
  /* Removes default underline */
  color: purple;
}
#new-price {
  color: green;
}
</panel>
</code>
</codeblock>

`text-decoration` is a versatile property. We can use it in many more ways to decorate the text.