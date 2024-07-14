The size of the `radial-gradient` can also be
specified using various keywords as values.

- **closest-side**: Sets the gradient's size to the shortest distance from the center to the closest side of the container.
- **closest-corner**: Sets the gradient's size to the shortest distance from the center to the closest corner of the container.
- **farthest-side**: Sets the gradient's size to the longest distance from the center to the farthest side of the container.
- **farthest-corner**: Sets the gradient's size to the longest distance from the center to the farthest corner of the container.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden="true">
<div class="box first"></div>
<div class="box second"></div>
</panel>
<panel language="css" hidden="true">
body {
  display: flex;
  justify-content: space-around;
}

.box {
  width: 200px;
  height: 200px;
  margin-top: 20px;
}

.first {
  background: radial-gradient(closest-side at 30% 30%, red, yellow, green);
}

.second {
  background: radial-gradient(farthest-side at 30% 30%, red, yellow, green);
}
</panel>
</code>
</codeblock>

In the above example, the gradient starts from the
center positioned at **30%** on both X and Y axis.
The first one creates a size set to the **closest side**,
and the second one creates a size set to the **farthest side**.

Let's look at another example:

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden="true">
<div class="box first"></div>
<div class="box second"></div>
</panel>
<panel language="css" hidden="true">
body {
  display: flex;
  justify-content: space-around;
}

.box {
  width: 200px;
  height: 200px;
  margin-top: 20px;
}

.first {
  background: radial-gradient(closest-corner at 30% 30%, red, yellow, green);
}

.second {
  background: radial-gradient(farthest-corner at 30% 30%, red, yellow, green);
}
</panel>
</code>
</codeblock>

In the above example, the gradient starts from the
center positioned at **30%** on both X and Y axis.
The first one creates a size set to the **closest corner**,
and the second one creates a size set to the **farthest corner**.
