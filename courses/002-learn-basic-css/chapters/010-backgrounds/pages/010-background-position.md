By default, the background image
starts at the top left corner of its HTML element.
This can be changed using the `background-position` property.

This property takes in two values like this:
`background-position: left center`.
The first value is for the horizontal
and the second one is for the vertical position:

<Editor lang="css">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
div {
  height: 300px;
  background-color: lightblue;
  background-image: url('https://images.pexels.com/photos/207305/pexels-photo-207305.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
  background-repeat: no-repeat;
  background-position: right top;
}
</panel>
</code>
</Editor>

In the above code example, try changing the `background-position` value to `center bottom` or `right center`.

If only one value is specified,
that will be for the horizontal
and
the vertical will be `center` by default:

<Editor lang="css">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
div {
  height: 300px;
  background-color: lightblue;
  background-image: url('https://images.pexels.com/photos/207305/pexels-photo-207305.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
  background-repeat: no-repeat;
  background-position: bottom;
}
</panel>
</code>
</Editor>

Using keywords like `left`, `top`, `center`
we can only position the background image
to either the extreme ends or the center.
For better control, we can use percentages,
or pixels:

<Editor lang="css">
<code>
<panel lang="html">
<div>
</div>
</panel>
<panel lang="css">
div {
  height: 300px;
  background-color: lightblue;
  background-image: url('https://images.pexels.com/photos/207305/pexels-photo-207305.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
  background-repeat: no-repeat;
  background-position: 30% 10px;
}
</panel>
</code>
</Editor>

Change the `background-position` value to `100% 100%` in the code example above and see what happens.
