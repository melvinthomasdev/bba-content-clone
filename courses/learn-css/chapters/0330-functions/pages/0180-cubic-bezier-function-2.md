We use `cubic-bezier()` function as the
value of the `transition-timing-function`
property to apply custom timing functions
to transitions.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="box one">Slow to fast</div>
<p>cubic-bezier(0.55, 0.08, 0.68, 0.53)</p>

<div class="box two">Fast to slow</div>
<p>cubic-bezier(0.19, 1.00, 0.22, 1.00)</p>

<div class="box three">Smooth</div>
<p>cubic-bezier(0.25, 0.10, 0.25, 1.00)</p>

<div class="box four">Bounce!</div>
<p>cubic-bezier(0.73, -0.60, 0.32, 1.65)</p>
</panel>
<panel language="css">
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
}

.box {
  margin-bottom: 10px ;
  width: 150px;
  height: 50px;
  background-color: #3498db;
  color: white;
  text-align: center;
  line-height: 50px;
}

.one {
  transition-property: width;
  transition-duration: 2s;
  transition-timing-function: cubic-bezier(0.55, 0.08, 0.68, 0.53);
}

.two {
  transition-property: width;
  transition-duration: 2s;
  transition-timing-function: cubic-bezier(0.19, 1.00, 0.22, 1.00);
}

.three {
  transition-property: width;
  transition-duration: 2s;
  transition-timing-function: cubic-bezier(0.25, 0.10, 0.25, 1.00);
}

.four {
  transition-property: width;
  transition-duration: 2s;
  transition-timing-function: cubic-bezier(0.73, -0.60, 0.32, 1.65);
}

.box:hover {
  width: 300px;
  background-color: #e74c3c;
}
</panel>
</code>
</codeblock>

- **Slow to fast** : The animation starts slowly and accelerates as it progresses.
- **Fast to slow** : The animation starts quickly and then decelerates towards the end.
- **Smooth** : The animation is smooth and uniform throughout.
- **Bounce!** : The animation has a bouncy effect.
