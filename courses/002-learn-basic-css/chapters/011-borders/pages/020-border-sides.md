We can set different styles,
widths and colours for the borders of
the different sides of an element.
We do this by specifying multiple values
for the same property, like
`border-width: 3px 3px 4px 5px`.

However, there are individual properties
such as `border-top-style`,
`border-right-width`, `border-bottom-color`
among others, for styling borders
for the specific sides:

<Editor lang="css">
<code>
<panel lang="html">
<div id="first">
  Left and right color properties
</div>
<div id="second">
  Top and bottom style properties
</div>
</panel>
<panel lang="css">
div {
  padding: 10px;
  margin: 10px;
}
#first {
  border-style: solid;
  border-left-color: red;
  border-right-color: green;
}
#second {
  border-top-style: dashed;
  border-bottom-style: dashed;
  border-color: #cccccc;
}
</panel>
</code>
</Editor>

For `#second`, we only specified the `border-style` for
the top and bottom sides.
And
the `border-color` values
have an effect only when `border-style` is specified.
This is why, in the `#second` div, the
`border-color` is only visible for the top
and
bottom sides.

