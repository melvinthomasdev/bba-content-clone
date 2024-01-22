Links can be styled in many different ways using
properties like `color`, `background-color`,
`border`, `padding`, `text-decoration`
and so on:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>Styling Links</h2>
<a href="#" id="first">
  Colored link
</a>
<a href="#" id="second">
  No underline
</a>
<a href="#" id="third">
  With background
</a>
<a href="#" id="fourth">
  With border
</a>
</panel>
<panel language="css">
a {
  margin-right: 30px;
  font-family: sans-serif;
}
#first {
  color: tomato;
}
#second {
  color: teal;
  text-decoration: none;
}
#third {
  padding: 12px 15px;
  text-decoration: none;
  color: darkgreen;
  background-color: lightgreen;
}
#fourth {
  padding: 12px 15px;
  text-decoration: none;
  color: orange;
  border: 1px solid;
}
</panel>
</code>
</codeblock>