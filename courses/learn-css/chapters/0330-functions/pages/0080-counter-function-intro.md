The `counter()` function is used to
dynamically add numbers before
various sections of a web page.
It is used in combination
with the `counter-reset` and
`counter-increment` properties.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <h2>Gradients</h2>
  <p>
    CSS gradients allow you to create smooth transitions between two or more colours in your web design, adding depth and visual appeal to your elements.
  </p>

  <h2>Backgrounds</h2>
  <p>
    CSS backgrounds provide you with the tools to customize the background of elements, including setting images, colours, and repeating patterns.
  </p>

  <h2>Typography</h2>
  <p>
    CSS typography enables you to control font styles, sizes, and spacing, helping you achieve the desired text presentation on your website.
  </p>
</div>
</panel>
<panel language="css">
div {
  counter-reset: chapter-counter;
}

h2 {
  margin: 20px 0;
}

h2::before {
  content: "Chapter " counter(chapter-counter) ": ";
  counter-increment: chapter-counter;
  color: #0077b6;
}
</panel>
</code>
</codeblock>

In the above example, we
are using CSS counters to
automatically number
and label the chapters.
Counters are displayed
using pseudo elements.