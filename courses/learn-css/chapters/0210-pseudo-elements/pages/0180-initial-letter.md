Observe the very first letter
of the first paragraph in
the image of a news report
provided below.

<image>initial-letter.png</image>

The CSS property `initial-letter`
allows us to apply similar style
to the first letter of any HTML
element.

Syntax:
```css
selector::first-letter {
  initial-letter: value-1 value-2;
}
```

We need to apply the
`::first-letter` pseudo-element
for `initial-letter` property
to work correctly.

The `initial-letter` property
accepts two numeric values separated
by a space.
`value-1` determines the size of
the first letter,
specified in terms of how many
lines it occupies.
`value-2` helps us control the
vertical alignment of the first
letter.

Let us have a look at an example:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
</p>
</panel>
<panel language="css">
p::first-letter {
  initial-letter: 3 2;
}
</panel>
</code>
</codeblock>

In the above code, we have defined
the first letter **L** to have a size
of **3**. This makes the letter
occupy 3 lines.

The second value defined is **2**.
As we can see the letter is dropped
2 lines below the current line of
text.

## Note:
This property is currently supported
in Chrome, Safari, Opera and other browsers
and not currently supported in Firefox browser.
