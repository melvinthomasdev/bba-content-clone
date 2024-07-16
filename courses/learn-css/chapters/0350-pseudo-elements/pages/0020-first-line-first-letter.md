When you want to style only
the first line of a paragraph
or the first line of each paragraph
differently, you can use the
`::first-line` pseudo-element:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <p>
    Albert Einstein was a German-born theoretical physicist, widely acknowledged to be one of the greatest physicists of all time.
  </p>
  <p>
    Einstein is known for developing the theory of relativity, but he also made important contributions to the development of the theory of quantum mechanics.
  </p>
</div>
</panel>
<panel language="css">
div {
  max-width: 400px;
}
p::first-line {
  font-size: 1.2rem;
  line-height: 1.2rem;
  color: brown;
}
</panel>
</code>
</codeblock>

Similarly, when you want
to style only the first letter
of a paragraph or first letter of
each paragraph differently, you can
use the `::first-letter` pseudo-element:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <p>
    Albert Einstein was a German-born theoretical physicist, widely acknowledged to be one of the greatest physicists of all time.
  </p>
  <p>
    Einstein is known for developing the theory of relativity, but he also made important contributions to the development of the theory of quantum mechanics.
  </p>
</div>
</panel>
<panel language="css">
div {
  max-width: 400px;
}
p::first-letter {
  font-size: 2rem;
  color: brown;
}
</panel>
</code>
</codeblock>

Also, if you wish to select the
first letter of only the first
paragraph, you can combine the
`:first-child` pseudo-class with
`:first-letter` like this:

```
p:first-child::first-letter
```

Try using this in the editor above.