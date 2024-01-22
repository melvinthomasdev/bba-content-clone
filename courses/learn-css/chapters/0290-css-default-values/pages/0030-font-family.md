The **`font-family`** attribute specifies which font family is used.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>Understanding the default font family</p>
</panel>
<panel language="css">
p {
  font-family: 'Roboto', 'Verdana', sans-serif;
}
</panel>
</code>
</codeblock>

There is no specific default or initial value for `font-family`,
but it depends on the browser or operating system.

Let's look at some code snippets:

```css
p {
  font-family: 'Roboto', 'Verdana';
}
```

If both fonts `Roboto` and `Verdana` are not available, the font would
default to the user's system default font that is
usually `serif` or `sans-serif`.
