The `outline` property helps us visualize
how large or small is an element in our
design.

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html"  hidden="true">
<header class="header">
  <h1>Fashion Hub</h1>
</header>

<div class="container">
  <aside>
    <h2>Categories</h2>
    <ul>
      <li>Dresses</li>
      <li>Accessories</li>
      <li>Footwear</li>
    </ul>
  </aside>

  <main class="content">
    <h2>Elevate Your Style: Fashion Hub</h2>
    <p>Your Premier Destination for Trendy Fashion!</p>
  </main>
</div>

<footer class="footer">
  <p>&copy; 2023 Fashion Hub. All rights reserved.</p>
</footer>
</panel>
<panel language="css"  hidden="true">
header {
  background-color: gray;
  color: white;
  text-align: center;
  padding: 20px;
}

.container {
  display: flex;
}

main {
  width: 70%;
  padding: 20px;
}

aside {
  width: 30%;
  background-color: lightgray;
  padding: 20px;
}

ul {
  padding-top: 20px;
}

footer {
  background-color: gray;
  color: white;
  text-align: center;
  padding: 20px;
}
</panel>
</code>
</codeblock>

In the above example, a `padding-top` of **20px**
was added to the `<ul>` element for spacing.
But, it's not clear whether this padding was
included within the element's dimensions or
applied outside.

To understand this, let's add an **outline**
to the `<ul>` element and observe its effect.

<codeblock language="css" type="lesson">
<code>
<panel language="html"  hidden="true">
<header class="header">
  <h1>Fashion Hub</h1>
</header>

<div class="container">
  <aside>
    <h2>Categories</h2>
    <ul>
      <li>Dresses</li>
      <li>Accessories</li>
      <li>Footwear</li>
    </ul>
  </aside>

  <main class="content">
    <h2>Elevate Your Style: Fashion Hub</h2>
    <p>Your Premier Destination for Trendy Fashion!</p>
  </main>
</div>

<footer class="footer">
  <p>&copy; 2023 Fashion Hub. All rights reserved.</p>
</footer>
</panel>
<panel language="css">
header {
  background-color: gray;
  color: white;
  text-align: center;
  padding: 20px;
}

.container {
  display: flex;
}

main {
  width: 70%;
  padding: 20px;
}

aside {
  width: 30%;
  background-color: lightgray;
  padding: 20px;
}

/*outline applied to unordered list*/
ul {
  padding-top: 20px;
  outline: 1px solid tomato;
}

footer {
  background-color: gray;
  color: white;
  text-align: center;
  padding: 20px;
}
</panel>
</code>
</codeblock>

In the above example, we applied a
`1px solid tomato` outline to the `<ul>` element.
This outline helps us visualize the dimensions
of the `<ul>` element and understand where
the **20px** padding was added.
