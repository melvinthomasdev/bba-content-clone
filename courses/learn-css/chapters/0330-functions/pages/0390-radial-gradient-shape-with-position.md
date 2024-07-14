By default, the gradient starts from the center,
but we can change its position by specifying
it along with the shape of the gradient
using position keywords.

Common positions keywords include **top**, **bottom**,
**left**, **right**, **top left**, **bottom right**, etc.

Let's look at some examples:

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
  width: 200px;
  height: 200px;
  margin-top: 20px;
}

.first {
  background: radial-gradient(circle at top, red, yellow, green);
}

.second {
  background: radial-gradient(ellipse at bottom right, red, yellow, green);
}
</panel>
</code>
</codeblock>

In the example above, the first one creates a circular
gradient with the center at the top,
and the second one creates an elliptical gradient
with the center at the bottom right.
