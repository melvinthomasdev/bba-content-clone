The `span`, `a` and `img` elements have their `display` set to `inline` by default. These elements do not start on a new line and take up only as much space as required.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<ul>
  <li><a href="#">Home</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Contact</a></li>
</ul>
</panel>
<panel language="css">
li {
  display: inline;
}
a {
  padding: 10px;
}
</panel>
</code>
</codeblock>

For `inline` elements, we cannot specify width or height. Also, vertical margins do not have any effect:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p>Some links for your reference:</p>
<a href="#">Link 1</a>
<a href="#">Link 2</a>
</panel>
<panel language="css">
a {
  background-color: orange;
  /* Properties given below have no effect */
  width: 200px;
  height: 100px;
  margin-top: 50px;
}
</panel>
</code>
</codeblock>