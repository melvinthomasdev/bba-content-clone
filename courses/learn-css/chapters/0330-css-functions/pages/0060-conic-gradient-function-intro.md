The `conic-gradient()` CSS function
is used to generate circular gradients.
It can be applied as a value to the
`background`, `background-image`, and
`background-color` properties.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="conic first"></div>
<div class="conic second"></div>
</panel>
<panel language="css">
body {
  display: flex;
  justify-content: space-around;
}

.conic {
  width: 200px;
  height: 200px;
  border-radius: 50%;
}

.first {
  background: conic-gradient(
    red,
    yellow,
    green,
    blue,
    purple
  );
}

.second {
  background: conic-gradient(
    red,
    yellow,
    green,
    blue,
    red
  );
}
</panel>
</code>
</codeblock>

As you can see, in the `first` circle,
we used the colours `red`, `yellow`,
`green`, `blue` and `purple` as parameters.
In the `second` example, we repeated
the initial colour at the end for a
smoother transition around the circle.
