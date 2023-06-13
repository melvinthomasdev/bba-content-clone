**CSS variables**  are a way
to store and reuse values
in CSS stylesheets.

Let us have a look at an example:
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

In the above code we have
defined a **css variables**
named as `--primary-color`,
`--secondary-color`,
`--primary-font-weight`,
`--secondary-font-weight`
defined in the scope of
*div* element, these
variables are used
by the child elements
`h1` and `p`.

Variable names should begin
with double hyphen `--`,
each word should be in
lowercase and separated
by a hyphen `-`.

Once you have defined a CSS
variable, you can use it by
referencing its name.

Syntax to reference a **css variable**
is as follows:
```css
property-name: var(--css-variable-name)
```

Let us take a look at
another example.
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

As we can see in the above code,
we have defined the same variable
`--primary-color` with a value
of **blue** and referenced this
variable when we are giving a
**color** property to the
`h1` tag.
