By default, the `linear-gradient` function generates
a gradient that goes from **top to bottom**.
This can be changed by specifying the direction
of the gradient using keywords such as
`to top`, `to bottom`, `to left`, and `to right`.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="box first"></div>
<div class="box second"></div>
</panel>
<panel language="css">
body {
  display: flex;
  justify-content: space-around;
}

.box {
  height: 90vh;
  width: 40vw;
  border: 1px solid black;
}

.first {
  background: linear-gradient(to right, green, yellow);
}

.second {
  background: linear-gradient(to left, green, yellow);
}
</panel>
</code>
</codeblock>

As shown in the example above, `to right`
means the gradient starts from the left side
and goes to the **right**.
Similarly, `to left` means it starts from
the right and goes to the **left**.
