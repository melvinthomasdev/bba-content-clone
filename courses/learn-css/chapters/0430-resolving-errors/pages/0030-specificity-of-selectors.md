Specificity is something that
we sometimes forget to keep a
track of.
This causes errors.

In the code example below,
we have two CSS rules.

The first rule selects all `<p>` elements
and
sets their text color to **blue**.

The second rule uses an **ID** selector
`#special-paragraph` to select a specific
`<p>` element and change its color to **red**.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>Hello world</p>
<p>This is a good day! 😊</p>
<p class="paragraph">I will take my dog for a walk.</p>
<p class="paragraph" id="special-paragraph">And we will get ice creams!😃</p>
</panel>
<panel language="css">
p {
  color: blue;
}

#special-paragraph {
  color: red;
}
.paragraph {
  color: green;
}
</panel>
</code>
</codeblock>

We can observe that **ID** is more
important **class**.

Similarly, **class** is more important
than using elements to select.
