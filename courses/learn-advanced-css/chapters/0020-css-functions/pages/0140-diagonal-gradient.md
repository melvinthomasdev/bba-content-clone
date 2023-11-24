We can define diagonal gradients using
keywords such as `to top right`, `to top left`,
`to bottom right`, and `to bottom left`.

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
  background: linear-gradient(to top right, red, yellow, indigo);
}

.second {
  background: linear-gradient(to top left, red, yellow, indigo);
}
</panel>
</code>
</codeblock>

In the example above, `to top right` means
the gradient starts from the **bottom left**
corner and goes to the **top right**.
Similarly, `to top left` means
the gradient starts from the **bottom right**
corner and goes to the **top left**.
