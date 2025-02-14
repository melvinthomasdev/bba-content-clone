When you need rounded corners
instead of the default sharp corners,
you can use the `border-radius` property.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="first">
</div>
<div id="second">
</div>
</panel>
<panel language="css">
div {
  width: 100px;
  height: 100px;
  margin: 10px;
}
#first {
  background-color: teal;
  border-radius: 15px;
}
#second {
  background-color: red;
  border: 5px solid darkred;
  border-radius: 50%;
}
</panel>
</code>
</codeblock>

A square can be turned into a circle
and a rectangle into an oval,
if we give `border-radius` the value `50%`.

As you can see in the above example,
`border-radius` can be used with
or without the `border` property.