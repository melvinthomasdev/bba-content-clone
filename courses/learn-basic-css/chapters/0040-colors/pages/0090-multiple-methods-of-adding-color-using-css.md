To add colour, we can use
`rgb`, `hex`, `hsl` or simply
the colour name.

It doesn't matter which method we use.

Let's see an example:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <h2>Countries:</h2>
  <p class="america">America</p>
  <p class="india">India</p>
  <p class="australia">Australia</p>
  <p class="africa">Africa</p>
</div>
</panel>
<panel language="css">
.container {
  text-align: center;
}

.america {
  color: rgb(255, 0, 0); /* RGB value for red */
}

.india {
  color: #FF0000; /* HEX value for red */
}

.australia {
  color: hsl(0, 100%, 50%); /* HSL value for red */
}

.africa {
  color: red; /* Colour name value for red */
}
</panel>
</code>
</codeblock>

We can see that all four methods
give us the same text colour.
