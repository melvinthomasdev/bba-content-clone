
The `padding` property defines
the spacing within an element,
controlling the space between the content
in the element and its boundaries.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="parent">
  <p>Welcome to BB Academy</p>
</div>
</panel>
<panel language="css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.parent {
  background-color: lightblue;
  height: 80px;
  padding: 30px;
}

p {
  width: 50%;
  background-color: chartreuse;
}
</panel>
</code>
</codeblock>

In the provided example,
padding is applied to the `div` container
with class `parent`.

As a result, we observe margin space
between the `p` element
and
the parent container.

However, we also notice space to the
left of the `p` element.

This occurs because padding is applied
on all sides of the `div` container
with class `parent`.

We will learn how to add padding to
individual sides in the next lesson.
