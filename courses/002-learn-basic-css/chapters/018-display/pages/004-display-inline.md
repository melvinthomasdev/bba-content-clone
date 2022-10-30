The `span`, `a` and `img` elements have their `display` set to `inline` by default. These elements do not start on a new line and take up only as much space as required.

<Editor lang="css">
<code>
<panel lang="html">
<ul>
  <li><a href="#">Home</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Contact</a></li>
</ul>
</panel>
<panel lang="css">
li {
  display: inline;
}
a {
  padding: 10px;
}
</panel>
</code>
</Editor>

For `inline` elements, we cannot specify width or height. Also, vertical margins do not have any effect:

<Editor lang="css">
<code>
<panel lang="html">
<p>Some links for your reference:</p>
<a href="#">Link 1</a>
<a href="#">Link 2</a>
</panel>
<panel lang="css">
a {
  background-color: orange;
  /* Properties given below have no effect */
  width: 200px;
  height: 100px;
  margin-top: 50px;
}
</panel>
</code>
</Editor>