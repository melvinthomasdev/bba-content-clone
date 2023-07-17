Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>Explore Topics:</h2>
<div>
  <a href="#">Design</a>
  <a href="#">Science</a>
  <a href="#">Music</a>
</div>
<p>Expand your knowledge in various domains!</p>
</panel>
<panel language="css">
a {
  margin-top: 10px;
  margin-bottom: 10px;
  color: white;
  text-decoration: none;
  padding: 10px;
  background-color: slateblue;
  border-radius: 5px;
}
</panel>
</code>
</codeblock>

In the above example, we are attempting to add
space above and below the `<a>` tags,
using the `margin-top` and `margin-bottom` properties.
But, it will have no effect. Try changing the value
of `margin-top` or `margin-bottom` to **100px**.
You'll see that no space is added above or below the links.

This is because, by default,
`<a>` tags have an `inline display` property.

To overcome this issue, we can employ the following methods:

**Changing the display property:**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>Explore Topics:</h2>
<div>
  <a href="#">Design</a>
  <a href="#">Science</a>
  <a href="#">Music</a>
</div>
<p>Expand your knowledge in various domains!</p>
</panel>
<panel language="css">
a {
  display: inline-block;

  margin-top: 10px;
  margin-bottom: 10px;
  color: white;
  text-decoration: none;
  padding: 10px;
  background-color: slateblue;
  border-radius: 5px;
}
</panel>
</code>
</codeblock>

In the above example, we changed the display property
of the `<a>` tags to `display: inline-block`.

Thus, the `<a>` tags get treated as **block-level** elements,
allowing us to apply the margins. Try changing the values for
`margin-top` and `margin-bottom` and now you'll notice that
the space above and below the links changes.

**Applying padding on the parent element:**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>Explore Topics:</h2>
<div class="container">
  <a href="#">Design</a>
  <a href="#">Science</a>
  <a href="#">Music</a>
</div>
<p>Expand your knowledge in various domains!</p>
</panel>
<panel language="css">
.container {
  padding-top: 10px;
  padding-bottom: 10px;
}
a {
  color: white;
  text-decoration: none;
  padding: 10px;
  background-color: slateblue;
  border-radius: 5px;
}
</panel>
</code>
</codeblock>

In the above example, a **container** element with
the class `.container` wraps the `<a>` tags.

By adding `padding-top` and `padding-bottom` to the container,
we created **10 pixels** of vertical spacing above and below each `<a>` tag.
