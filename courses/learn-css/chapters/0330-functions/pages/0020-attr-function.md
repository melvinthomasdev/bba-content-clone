The `attr()` function in CSS allows
us to use HTML attribute values as
CSS property values.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
  <p data-caption="Academy">BigBinary </p>
</panel>
<panel language="css">
p {
  color: blue;
  font-size: 32px;
  font-weight: 500;
  font-family: Inter,sans-serif;
}

p:hover::after {
  content: attr(data-caption);
}
</panel>
</code>
</codeblock>

In the above example, we are using
the data attribute `data-caption`
within the `attr()` function.
When we hover over the paragraph,
its content is dynamically displayed.
