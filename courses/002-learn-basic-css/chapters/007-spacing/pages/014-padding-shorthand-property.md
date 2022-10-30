Instead of using individual properties for
top, bottom, right and left padding,
the single `padding` property can be used
to specify different values for each direction.

## Four values

If this property has
four different values
separated by spaces:

```
padding: 10px 20px 30px 40px;
```

`10px` is top padding<br>
`20px` is right padding<br>
`30px` is bottom padding<br>
`40px` is left padding

The values get assigned in clockwise direction starting from the top.

<Editor lang="css">
<code>
<panel lang="html">
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites. The different areas of web design include web graphic design; user interface design (UI design); authoring, including standardised code and proprietary software; user experience design (UX design); and search engine optimization.
</p>
</panel>
<panel lang="css">
p {
  background-color: lightgray;
  padding: 50px 100px 80px 20px; /* top right bottom left */
}
</panel>
</code>
</Editor>

## Three values

If this property has three values:

```
padding: 10px 20px 30px;
```

`10px` is top padding<br>
`20px` is right and left padding<br>
`30px` is bottom padding

<Editor lang="css">
<code>
<panel lang="html">
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites. The different areas of web design include web graphic design; user interface design (UI design); authoring, including standardised code and proprietary software; user experience design (UX design); and search engine optimization.
</p>
</panel>
<panel lang="css">
p {
  background-color: lightgray;
  padding: 50px 20px 80px; /* top right-left bottom */
}
</panel>
</code>
</Editor>

## Two values

If this property has two values:

```
padding: 10px 20px;
```

Top padding and bottom padding are both **10px**.<br>
Right padding and left padding are both **20px**.

<Editor lang="css">
<code>
<panel lang="html">
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites. The different areas of web design include web graphic design; user interface design (UI design); authoring, including standardised code and proprietary software; user experience design (UX design); and search engine optimization.
</p>
</panel>
<panel lang="css">
p {
  background-color: lightgray;
  padding: 50px 100px; /* top-bottom right-left */
}
</panel>
</code>
</Editor>

## One value

If this property has only one value:

```
padding: 10px;
```

All four padding values are `10px`

<Editor lang="css">
<code>
<panel lang="html">
<p>
  Web design encompasses many different skills and disciplines in the production and maintenance of websites. The different areas of web design include web graphic design; user interface design (UI design); authoring, including standardised code and proprietary software; user experience design (UX design); and search engine optimization.
</p>
</panel>
<panel lang="css">
p {
  background-color: lightgray;
  padding: 50px;
}
</panel>
</code>
</Editor>