Change the display for `a` elements such that the width value applies, but the elements still stay in the same line:

<Editor lang="css" type="exercise">
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
  width: 120px;
  padding: 10px;
  background-color: teal;
  color: white;
  text-decoration: none;
  text-align: center;
}
</panel>
</code>

<solution>
li {
  display: inline;
}
a {
  width: 120px;
  padding: 10px;
  background-color: teal;
  color: white;
  text-decoration: none;
  text-align: center;
  display: inline-block
}
</solution>
</Editor>