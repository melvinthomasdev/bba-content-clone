We can specify the direction of a
linear gradient using **degrees**.
The default value of 0 degrees
results in a top to bottom gradient.

We can use positive and negative degree
values to control the orientation.

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
  height: 90vh;
  width: 40vw;
  border: 1px solid black;
}

.first {
  background: linear-gradient(45deg, blue, lightblue, green);
}

.second {
  background: linear-gradient(-45deg, blue, lightblue, green);
}
</panel>
</code>
</codeblock>

In the above example, we applied positive and
negative `45deg` angles to achieve a
diagonal gradient.
The `45deg` creates a diagonal gradient
from bottom left **to top right**,
while the `-45deg` results in a diagonal
gradient from bottom right **to top left**.
