The `top` and `left`
properties appear to work similar
to the `margin-top`
and the `margin-left` properties.
But there is a big difference between them.

Let's look at an example. When you set the `top`
property of a relative element to **50px**,
only that element is shifted by **50px** from the top.
But if you set the `margin-top` property to **50px**,
all the elements below this particular
element are also shifted down by **50px**.

Try changing `top` to `margin-top` for the
relative element in the example given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="relative">
  Relative element!
</div>
<div>
  A div element below the relative one.
</div>
</panel>
<panel language="css">
#relative {
  position: relative;
  padding: 10px;
  background-color: orange;
  top: 60px;
}
</panel>
</code>
</codeblock>

Similarly, when you set the `left`
property of a relative element,
only that element is shifted
from the left of its original
position.

Try changing `margin-left` to
`left` for the button
in the example given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<button>
  I do nothing!
</button>
<span>Building a new world is not my responsibility.</span>
</panel>
<panel language="css">
button {
  position: relative;
  border: 3px dotted steelblue;
  background-color: steelblue;
  padding: 0.5rem 1rem;
  color: snow;
  font-family: Helvetica;
  font-size: 1.4rem;
  /*
  Change the margin-left property to left and see the result
  */
  margin-left: 250px;
}

span {
  font-family: Helvetica;
}
</panel>
</code>
</codeblock>