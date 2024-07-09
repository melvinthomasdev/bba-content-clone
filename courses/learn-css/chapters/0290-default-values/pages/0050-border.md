**`border`** is a shorthand for
`border-width`, `border-style`,
and `border-color`. It is used to set
an element's border.

The **default values** of these properties are:

```css
border-style: none;
border-width: medium;
border-color: currentcolor;
```

Let's look at some examples, to understand it further:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  A thin dashed red border.
</p>
</panel>
<panel language="css">
p {
  border: thin dashed red;
}
</panel>
</code>
</codeblock>

Now, let's try removing these properties one by one:

Removing the value  `thin` makes the border width `medium`, which is its default value.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  A dashed red border.
</p>
</panel>
<panel language="css">
p {
  border: dashed red;
}
</panel>
</code>
</codeblock>

Let's remove the border color property `red`.
The color goes back to its default value which is the color of the text of the element.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  A dashed border.
</p>
</panel>
<panel language="css">
p {
  border: dashed;
}
</panel>
</code>
</codeblock>

Finally, let's try removing the border style property `dashed`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
  A border.
</p>
</panel>
<panel language="css">
p {
  border: ;
}
</panel>
</code>
</codeblock>

This removes the border completely, as the default value is `border-style: none`.
