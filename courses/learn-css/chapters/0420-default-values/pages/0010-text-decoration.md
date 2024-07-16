**`text-decoration`** is a shorthand for
`text-decoration-line`, `text-decoration-color`,
`text-decoration-style`, and `text-decoration-thickness`
properties.

Let's look at an example where we are setting a value
for each of the properties mentioned above.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  Text decoration
</p>
</panel>
<panel language="css">
p{
  text-decoration: underline wavy red 2px;
}
</panel>
</code>
</codeblock>

While we can set each property a value, there are some **default values** as well, like:

```css
text-decoration-color: currentcolor
text-decoration-style: solid
text-decoration-line: none
```

Now let's try removing properties one by one to understand the default values:

Example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  Default thickness is 1px
</p>
</panel>
<panel language="css">
p{
  text-decoration: underline wavy red;
}
</panel>
</code>
</codeblock>

In the example above if we don't specify the `text-decoration-thickness`
value, it becomes 1px as default.


Similarly, let's try removing the `text-decoration-color`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  Default text decoration color is element's color
</p>
</panel>
<panel language="css">
p{
  color: blue;
}
p{
  text-decoration: underline wavy;
}
</panel>
</code>
</codeblock>

In the example above we could observe that the `underline` is
of the same color as the element's text color, i.e. **blue**.

Now, let's try removing the `text-decoration-style`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  Default text decoration style is solid
</p>
</panel>
<panel language="css">
p{
  text-decoration: underline;
}
</panel>
</code>
</codeblock>
