We can change the position of the gradient
by specifying percentage values on the X-axis and Y-axis.

- **X-axis horizontal position:**
  - `0%` represents the left edge of the container.
  - `50%` represents the center of the container.
  - `100%` represents the right edge of the container.

- **Y-axis vertical position:**
  - `0%` represents the top edge of the container.
  - `50%` represents the center of the container.
  - `100%` represents the bottom edge of the container.

By combining both the values, we can position the gradient's center:

- `at 0% 0%`: The top-left corner of the container.
- `at 50% 50%`: The center of the container.
- `at 100% 100%`: The bottom-right corner of the container.

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
  background: radial-gradient(circle at 0% 0%, red, yellow, green);
}

.second {
  background: radial-gradient(circle at 100% 100%, red, yellow, green);
}
</panel>
</code>
</codeblock>

In the example above, the first one creates a
gradient with center at the top-left corner **0% 0%**,
and the second one creates a gradient
with the center at the bottom right **100% 100%**.
