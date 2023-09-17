Your task is to review the provided HTML
and
CSS code and identify and fix the following
styling issues:

- The `<h1>` element text should be **red**
instead of **blue**.
- The text in the `<p>` elements should be
in the default font color of **lightgray**.
- The text inside the `<p>` element with
the class `info` should be **blue**.
- The `<h2>` element inside the `<div>`
should not have **bold** font weight.

Also fix all other issues in the code.
<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>Welcome to CSS Challenge</h1>
<img src= "https://upload.wikimedia.org/wikipedia/commons/b/ba/Javascript_badge.svg"
<p>A short description</p>
<p class="info">Additional Information</p>
<div>
  <h2 class="highlight">Section heading</h2>
</div>
</panel>
<panel language="css">
h1 {
  color: blue;
}

.info {
  font-size: 20px;
}

p {
  color: green;
}

.highlight {
  font-weight: bold;
}
</panel>
</code>
<solution>
<panel language="html">
<h1>Welcome to CSS Challenge</h1>
<img src= "https://upload.wikimedia.org/wikipedia/commons/b/ba/Javascript_badge.svg" />
<p>A short description</p>
<p class="info">Additional Information</p>
<div>
  <h2 class="highlight">Section heading</h2>
</div>
</panel>
<panel language="css">
h1 {
  color: red;
}

.info {
  font-size: 20px;
  color: blue;
}

p {
  color: lightgray;
}

.highlight {
  font-weight: bold;
}
</panel>
</solution>
</codeblock>
