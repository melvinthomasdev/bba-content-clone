The `counter-increment` property
is used to specify the increment
value. The default increment is 1.

```css
counter-increment: chapter-counter 2;
```

In the above code snippet, we are
incrementing the counter by multiples of 2.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <h2>Gradients</h2>
  <p>CSS gradients allow you to create smooth transitions between
   two or more colours in your web design, adding depth and visual
   appeal to your elements.</p>

  <h2>Backgrounds</h2>
  <p>CSS backgrounds provide you with the tools to customize the
   background of elements, including setting images, colours, and
   repeating patterns.</p>

  <h2>Typography</h2>
  <p>CSS typography enables you to control font styles, sizes,
   and spacing, helping you achieve the desired text presentation
   on your website.</p>
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
  counter-increment: chapter-counter 2;
  color: #0077b6;
}
</panel>
</code>
</codeblock>

In the example above, the `counter-increment` property
is used in the `h2::before` pseudo-element.
It increments the value of the `chapter-counter`
counter by **2** for each `<h2>` element.
This means that the counter will be incremented by **2**
each time it encounters an `<h2>` element.
