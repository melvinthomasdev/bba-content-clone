Instead of using individual properties for
top, bottom, right and left margins,
the single `margin` property can be used
to specify different values for each direction.

## Four values

If this property has
four different values
separated by spaces:

```
margin: 10px 20px 30px 40px;
```

`10px` is top margin<br>
`20px` is right margin<br>
`30px` is bottom margin<br>
`40px` is left margin

Values get assigned in the clockwise direction starting from the top.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="first">
  A paragraph with four margin values
</p>
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
</panel>
<panel language="css">
#first {
  background-color: yellow;
  margin: 50px 100px 80px 20px; /* top right bottom left */
}
</panel>
</code>
</codeblock>

## Three values

If this property has three values:

```
margin: 10px 20px 30px;
```

`10px` is top margin<br>
`20px` is right margin as well as the left margin<br>
`30px` is bottom margin

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="first">
  A paragraph with three margin values
</p>
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
</panel>
<panel language="css">
#first {
  background-color: yellow;
  margin: 50px 0px 80px; /* top right-left bottom */
}
</panel>
</code>
</codeblock>

## Two values

If this property has two values:

```
margin: 10px 20px;
```

`10px` is top and bottom margin<br>
`20px` is right and left margin

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="first">
  A paragraph with two margin values
</p>
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
</panel>
<panel language="css">
#first {
  background-color: yellow;
  margin: 50px 100px; /* top-bottom right-left */
}
</panel>
</code>
</codeblock>

## One value

If this property has only one single value:

```
margin: 10px;
```

All four margins are `10px` in size.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="first">
  A paragraph with one margin value
</p>
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
</panel>
<panel language="css">
#first {
  background-color: yellow;
  margin: 50px;
}
</panel>
</code>
</codeblock>