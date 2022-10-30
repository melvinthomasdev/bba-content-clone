When length of an element is specified using `em`,
it is calculated based on the **font size**
of the element. If this element has no `font-size` specified,
the length is calculated based on the
**font size** of its nearest parent HTML element.

As a default, `1em = 16px`.

<Editor lang="css">
<code>
<panel lang="html">
<div>
  Font size in em
</div>
</panel>
<panel lang="css">
html {
  font-size: 16px; /* Default */
}
div {
  width: 10em;
  height: 10em;
  background-color: orange;
  font-size: 1em;
}
</panel>
</code>
</Editor>

The width and height
of the `div` depends on its `font-size`.

Width is calculated as:

```
10em = 10*font-size = 10*1em = 10*16px = 160px
```

In the above example, `html` element is the parent element.
If you change the parent element's `font-size`,
the div's `font-size` is no longer `16px`:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  Font size in em
</div>
</panel>
<panel lang="css">
html {
  font-size: 10px;
}
div {
  width: 10em;
  height: 10em;
  background-color: orange;
  font-size: 1em;
}
</panel>
</code>
</Editor>

Font size of div is calculated as:

```
1em = 1*parent-font-size = 1*10px = 10px
```

And hence the width of this div is:

```
10em = 10*font-size = 10*10px = 100px
```