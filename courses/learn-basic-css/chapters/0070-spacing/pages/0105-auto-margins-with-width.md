There are some **HTML** elements 
that start on a new line
and
occupy the **full width** available
to them.

Let us have a look at some examples
of elements showing this behaviour:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
div element
</div>
<p>
p element
</p>
<h1>h1 to h6 elements</h1>
</panel>
<panel language="css" hidden="true">
div {
  background-color: red;
}

p {
  background-color: yellow;
}

h1 {
  background-color: green;
}
</panel>
</code>
</codeblock>

To ensure that `margin: auto`
functions effectively for these
HTML elements, we have to define
them with a fixed width.

By specifying a fixed width,
the browser can accurately
calculate and evenly distribute
the remaining space on both
sides, achieving correct
horizontal centering.

Let us have a look at an example:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<header class="header-container">
  <div class="centered-element">I have a width, the margin: auto property works!</div>
</header>
<br>
<footer class="footer-container">
  <div class="non-centered-element">I do not have a width, the margin: auto property does not work!</div>
</footer>
</panel>
<panel language="css">
.header-container {
  background-color: blue;
}
.centered-element {
  width: 50%;
  background-color: yellow;
  margin: auto;
}
.footer-container {
  background-color: red;
}
.non-centered-element {
  background-color: yellow;
  margin: auto;
}
</panel>
</code>
</codeblock>

It is important to remember that
when utilizing `margin: auto`
property to center these HTML
elements within their parent container,
the parent container should have
a **larger** width compared
to the width specified for the
element being centered.
