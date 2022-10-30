We can also apply styles to
an element based on its
location in HTML. If it's the
first child or the last
child of its parent element,
we can use `:first-child`
or `:last-child` pseudo-classes:

<Editor lang="css">
<code>
<panel lang="html">
<ul>
  <li>Home</li>
  <li>About</li>
  <li>Services</li>
  <li>Contact</li>
</ul>
<div>
  <a href="#">Link 1</a>
  <a href="#">Link 2</a>
  <a href="#">Link 3</a>
</div>
</panel>
<panel lang="css">
ul {
  list-style-type: none;
  margin: 0 0 40px -40px;
}
ul > li {
  display: inline-block;
  padding-right: 20px;
}
li:first-child {
  color: orange;
}
a:last-child {
  float: right;
}
</panel>
</code>
</Editor>

Here, `li:first-child` selects
any `li` element that is the first
child of its parent. And `a:last-child`
selects any `a` element that
is the last child of its parent.

In the above HTML editor,
try changing `<a href="#">Link 3</a>`
to `<span>Link 3</span>` to notice
that nothing gets selected,
because now the last child is
not an `a` element.