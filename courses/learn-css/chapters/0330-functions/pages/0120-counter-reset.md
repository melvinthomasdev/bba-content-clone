The `counter-reset` property
is used to define and initialize
the counter to our desired value.
By default, it resets the counter
to zero.

```css
counter-reset: chapter-counter 5;
```
In the above code snippet,
we are resetting the counter to 5.

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
  counter-reset: chapter-counter 5;
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

In the example above, the `counter-reset` property
is applied to the `<div>` element.
It resets the value of the `chapter-counter`
counter to **5**.
This means that any subsequent `counter-increment`
for the `chapter-counter` within descendants of
the `<div>` start counting from the initial value of **5**.