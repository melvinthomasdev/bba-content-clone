When we need to select only the
direct child elements, we use
the `>` character like this:

```
nav > ul
```

This will select all
 `ul` elements that are
direct children of `nav`.
It will not select anything else including
`ul` elements that
are nested deeper inside the `nav`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<nav>
  <ul>
    <li>
      <a href="#">Home</a>
    <li>
    <li>
      <a href="#">About</a>
    <li>
    <li id="dropdown">
      <ul>
        <li>
          <a href="#">Blog</a>
        </li>
        <li>
          <a href="#">Twitter</a>
        </li>
      </ul>
    <li>
  </ul>
</nav>
</panel>
<panel language="css">
nav > ul {
  list-style-type: none;
  font-family: Helvetica;
}

nav > ul > li {
  float: left;
  padding-right: 30px;
  color: black;
}

nav > ul > li > a {
  color: midnightblue;
  text-decoration: none;
  border-bottom: 3px solid midnightblue;
  font-weight: 700;
}
</panel>
</code>
</codeblock>

Notice that the `ul` and `li`
nested within **#dropdown** are
not affected by the styles. This is
because the `>` is only selecting the
children which are one level deep.