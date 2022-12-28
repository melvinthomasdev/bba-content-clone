When we need to select a particular
set of child elements, we use the
**space** character like this:

```
div a
```

Here, `div a` will select all `a`
elements that are the children of a
`div` element, even when those `a`
elements are nested deeper
within the `div`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <p>
    The internet is built with links
    <a href="#">Link 1 inside div 1</a>
  </p>
</div>
<div>
  <a href="#">Link 2 inside div 2</a>
</div>
<a href="#">Link 3</a>
<div>
  <p>
    A broken link is a broken promise.
    <a href="#">Link 4 inside div 3</a>
  </p>
</div>
<div>
  <a href="#">Link 5 inside div 4</a>
</div>
<a href="#">Link 6</a>
</panel>
<panel language="css">
div a {
  color: orange;
  text-decoration: none;
}
</panel>
</code>
</codeblock>

In the example given above,
all the `div` elements'
children that are `a` elements
are selected and given an **orange** colour.
Actually, not children, but **descendants** are
selected. Descendants include children,
and children's children and so on.

Link 3 and Link 6 are not a descendant
of any `div` element and hence are not
**orange**.

We can combine any number of selectors
with a **space**:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<nav>
  <ul>
    <li>
      <a href="#">Home</a>
    </li>
    <li>
      <a href="#">About</a>
    </li>
    <li>
      <a href="#">Contact</a>
    </li>
  </ul>
</nav>
<h3>
  List of seasons:
</h3>
<ul>
  <li>Summer</li>
  <li>Winter</li>
  <li>Spring</li>
  <li>Autumn</li>
</ul>
</panel>
<panel language="css">
nav ul {
  margin-left: -40px;
  list-style-type: none;
}
nav ul li {
  display:inline-block;
  padding-right: 10px
}
nav ul li a {
  color: purple;
  text-decoration: none;
}
</panel>
</code>
</codeblock>

In the above example,
`ul` and `li` elements that come
after the `h3`, **List of seasons**
are not descendants of the `nav`.
This is why, they are not
affected by the styles.