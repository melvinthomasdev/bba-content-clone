CSS allows us to store
and
re-use values in our
stylesheets.

These values are stored
as **CSS variables**.

Let's explore an example
where we are defining a
**CSS variable**:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <h1>CSS variable: --primary-color</h1>
  <p>CSS variable: --secondary-color</p>
</div>
</panel>
<panel language="css">
div {
  --primary-color: blue;
  --secondary-color: green;
  --primary-font-weight: 800;
  --secondary-font-weight: 400;
}

div > h1 {
  color: var(--primary-color);
  font-weight: var(--primary-font-weight);
}

div > p {
  color: var(--secondary-color);
  font-weight: var(--secondary-font-weight);
}
</panel>
</code>
</codeblock>

In the above code, we defined
the following **css variables**:
- `--primary-color`
- `--secondary-color`
- `--primary-font-weight`
- `--secondary-font-weight`

Variable names should begin
with double hyphen `--`,
each word should be in
lowercase and separated
by a hyphen `-`.

Once you have defined a CSS
variable, you can use it by
referencing it as shown below:
```css
property-name: var(--css-variable-name)
```

Let us take a look at
another example:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <h1>Title</h1>
  <p>Description</p>
</div>
</panel>
<panel language="css">

h1 {
  --primary-color: blue;
  color: var(--primary-color);
}
</panel>
</code>
</codeblock>

In the code above,
we defined the variable
`--primary-color` with the
value - **blue**.

Then we reference this variable,
as a value for the **color**
property of the `h1` tag.
