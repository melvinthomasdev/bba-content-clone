You can use the `outline` property
to check for CSS errors.
This is usually done by adding an
`outline` to all the elements of a webpage.

```css
* {
  outline: 1px solid tomato;
}
```

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<header>
  <h1>BigBinary Academy</h1>
</header>

<div class="container">
  <main>
    <section>
      <h2>Main Content</h2>
      <p>This is the main content of the page.</p>
    </section>
  </main>

  <aside>
    <h2>Sidebar</h2>
    <p>This is the side bar content.</p>
  </aside>
</div>

<footer>
  <p>&copy; BigBinary Academy. All rights reserved.</p>
</footer>
</panel>
<panel language="css">
* {
  outline: 1px solid tomato;
}

header {
  background-color: #333;
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
  background-color: lightgrey;
  padding: 20px;
}

footer {
  background-color: #333;
  color: white;
  text-align: center;
  padding: 20px;
}
</panel>
</code>
</codeblock>

In the above example, the coloured `outline`
is used to highlight the boundaries of each HTML element.
This helps developers quickly identify
the positioning and dimensions of each element.
