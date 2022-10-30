The `max-height` property
is used to define the
maximum height of an element.

If the content is smaller than the
value of the `max-height`,
this property has no effect.
But, if the content is larger than the
`max-height` value,
the content overflows.

When both `max-height` and `height` are defined,
the smaller of the two values is applied, as can
be seen in the code example given below:

<Editor lang="css">
<code>
<panel lang="html">
<p id="first">
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
<p id="second">
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
</panel>
<panel lang="css">
#first {
  height: 100px;
  max-height: 200px;
  /* Least value is applied */
  background-color: yellow;
}
#second {
  height: 100px;
  max-height: 25px;
  /* Least value is applied */
  background-color: orange;
}
</panel>
</code>
</Editor>

The `p` tag with `first` id and a background color of yellow, gets a height of 100px because that is the smaller value between the `max-height` and `height` values. And, the `p` tag with id `second` and a background color of orange, gets a height of 25px because of the same reason.
