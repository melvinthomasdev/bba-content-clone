Consider the following
example.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <h1>Dogs</h1>
  <p>Loyal friends</p>
</div>
</panel>
<panel language="css">
div {
  --color: red;
  --color: green;
}

div > p {
  color: var(--color);
}
</panel>
</code>
</codeblock>

We have declared same
*css variable* `--color`
twice with different values.

As we can see, the `p`
element has a font-color
of *green*, this happens
because of **specificity**.

When multiple variables are
declared with the same name,
the variable will pick the
last value assigned to it.
